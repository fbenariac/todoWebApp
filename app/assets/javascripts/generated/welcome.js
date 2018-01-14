var HelloWorld = /** @class */ (function () {
    function HelloWorld(name) {
        this.name = name;
    }
    HelloWorld.prototype.print = function () {
        alert("Hello World, " + this.name + "!");
    };
    return HelloWorld;
}());
new HelloWorld('John Doe').print();
//# sourceMappingURL=welcome.js.map