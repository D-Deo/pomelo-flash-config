package org.idream.pomelo 
{
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Deo
	 */
	public class Data 
	{
		private var _data:Dictionary;
		private var _ids:Array;
		
		/**
		 * 数据对象的构造函数，会自动解析 json 格式的配置表
		 * @param json 
		 * @param key 根据指定的 key 作为数据字典的索引，如不填则默认为 id
		 */
		public function Data(json:String, key:String = null) 
		{
			trace(json);
			var datas:* = JSON.parse(json);
			
			var fields:Array = [];
			for each (var k:String in datas[1]) 
			{
				fields.push(k);
			}
			
			_data = new Dictionary(true);
			_ids = [];
			for (var i:int = 2; i < datas.length; i++)
			{
				var items:Array = datas[i];
				var obj:Object = mapData(fields, items);
				
				_data[key ? obj[key] : obj.id] = obj;
				_ids.push(key ? obj[key] : obj.id);
			}
		}
		
		private function mapData(fields:Array, items:Array):Object
		{
			var obj:Object = { };
			for (var i:int = 0; i < fields.length; i++)
			{
				obj[fields[i]] = items[i];
			}
			return obj;
		}
		
		/**
		 * 根据指定属性的值查找对应的数据对象，返回一个数据对象数组
		 * @param attr 要查找的属性名称
		 * @param value 要查找的值
		 * @return Array 一个包含返回结果的数组
		 */
		public function findBy(attr:String, value:*):Array
		{
			var arr:Array = [];
			
			for each (var obj:Object in _data)
			{
				if (obj[attr] && obj[attr] == value) arr.push(obj);
			}
			
			return arr;
		}
		
		/**
		 * 根据 id 查找数据对象（此 id 必须是数据 key）
		 * @param id
		 * @return Object
		 */
		public function findById(id:*):Object
		{
			return _data[id];
		}
		
		/**
		 * 随即返回一个数据对象
		 * @return Object
		 */
		public function random():Object
		{
			var index:int = int(Math.random() * _ids.length);
			
			return _data[_ids[index]];
		}
		
		/**
		 * 返回当前数据对象的数量
		 * @return int
		 */
		public function amount():int
		{
			return _ids.length;
		}
		
		/**
		 * 返回一个包含全部数据对象的集合
		 * @return Dictionary
		 */
		public function all():Dictionary
		{
			return _data;
		}
	}

}