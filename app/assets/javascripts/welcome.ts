class HelloWorld {

    private name: string;

    constructor(name: string) {
        this.name = name;
    }

    print() {
        alert(`Hello World, ${this.name}!`);
    }
}

new HelloWorld('John Doe').print();
