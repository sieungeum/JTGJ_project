var CustomOverlay = function(options) {
    this._position = options.position;
    this._element = $('<div class="custom-overlay">' 
                    + options.content 
                    + '</div>');
    this.setPosition(options.position);
    this.setMap(options.map || null);
};

// CustomOverlay는 OverlayView를 상속받습니다.
CustomOverlay.prototype = new naver.maps.OverlayView();

CustomOverlay.prototype.constructor = CustomOverlay;

CustomOverlay.prototype.onAdd = function() {
    var overlayLayer = this.getPanes().overlayLayer;
    this._element.appendTo(overlayLayer);
    
    // 이벤트가 제거되지 않도록 매번 추가
    this._element.on('click', () => {
        moveToCenter(this._position);
    });
};

CustomOverlay.prototype.draw = function() {
    if (!this.getMap()) {
        return;
    }
    var projection = this.getProjection(),
        position = this.getPosition();
    var pixelPosition = projection.fromCoordToOffset(position);

    this._element.css('left', pixelPosition.x - 50);
    this._element.css('top', pixelPosition.y);
};

CustomOverlay.prototype.onRemove = function() {
    this._element.remove();
    // 이벤트를 여기서는 제거하지 않음
};

CustomOverlay.prototype.setPosition = function(position) {
    this._position = position;
    this.draw();
};

function moveToCenter(position) {
    map.morph(position, 10);
}

CustomOverlay.prototype.getPosition = function() {
    return this._position;
};
