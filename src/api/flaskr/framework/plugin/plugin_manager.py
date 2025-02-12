from flask import Flask
from .hot_reload import PluginHotReloader

plugin_manager = None


class PluginManager:
    def __init__(self, app: Flask):
        app.logger.info("PluginManager init")
        self.app = app
        self.extension_functions = {}
        self.extensible_generic_functions = {}
        self.hot_reloader = None
        self.plugins = {}

    def enable_hot_reload(self):
        """enable the hot reload"""
        if not self.hot_reloader:
            self.hot_reloader = PluginHotReloader(self.app)
            self.hot_reloader.start()

    def disable_hot_reload(self):
        """disable the hot reload"""
        if self.hot_reloader:
            self.hot_reloader.stop()
            self.hot_reloader = None

    def clear_extension(self, target_func_name):
        """clear all registered functions for the specified extension point"""
        if target_func_name in self.extension_functions:
            del self.extension_functions[target_func_name]

    def register_extension(self, target_func_name, func):
        self.app.logger.info(
            f"register_extension: {target_func_name} -> {func.__name__}"
        )
        if target_func_name not in self.extension_functions:
            self.extension_functions[target_func_name] = []
        self.extension_functions[target_func_name].append(func)

    def execute_extensions(self, func_name, result, *args, **kwargs):
        self.app.logger.info(f"execute_extensions: {func_name}")
        if func_name in self.extension_functions:
            for func in self.extension_functions[func_name]:
                result = func(result, *args, **kwargs)
        return result

    def register_extensible_generic(self, func_name, func):
        self.app.logger.info(
            f"register_extensible_generic: {func_name} -> {func.__name__}"
        )
        if func_name not in self.extensible_generic_functions:
            self.extensible_generic_functions[func_name] = []
        self.extensible_generic_functions[func_name].append(func)

    def execute_extensible_generic(self, func_name, result, *args, **kwargs):
        self.app.logger.info(f"execute_extensible_generic: {func_name}")
        if func_name in self.extensible_generic_functions:
            for runc in self.extensible_generic_functions[func_name]:
                result = runc(result, *args, **kwargs)
                if result:
                    yield from result
        return None


def enable_plugin_manager(app: Flask):
    app.logger.info("enable_plugin_manager")
    global plugin_manager
    plugin_manager = PluginManager(app)
    return app


# extensible decorator
def extensible(func):
    def wrapper(*args, **kwargs):
        global plugin_manager
        result = func(*args, **kwargs)
        result = plugin_manager.execute_extensions(
            func.__name__, result, *args, **kwargs
        )
        return result

    return wrapper


# extensible decorator
def extension(target_func_name):
    def decorator(func):
        plugin_manager.register_extension(target_func_name, func)
        return func

    return decorator


# extensible_generic decorator
def extensible_generic(func):
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        if result:
            yield from result
        if func.__name__ in plugin_manager.extensible_generic_functions:
            result = plugin_manager.execute_extensible_generic(
                func.__name__, *args, **kwargs
            )
            if result:
                yield from result
        return None

    return wrapper


def extensible_generic_register(func_name):
    def decorator(func):
        plugin_manager.register_extensible_generic(func_name, func)
        return func

    return decorator
