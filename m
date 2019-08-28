Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 81681A00FA
	for <lists.iommu@lfdr.de>; Wed, 28 Aug 2019 13:49:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E46FF2BD7;
	Wed, 28 Aug 2019 11:49:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BB3612BCD
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 11:49:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 1884A88E
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 11:49:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9668E344;
	Wed, 28 Aug 2019 04:49:13 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8917F3F246;
	Wed, 28 Aug 2019 04:49:11 -0700 (PDT)
Subject: Re: [PATCH v6 0/6] Allwinner H6 Mali GPU support
To: Neil Armstrong <narmstrong@baylibre.com>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>
References: <20190521161102.29620-1-peron.clem@gmail.com>
	<CAAObsKD8bij1ANLqX6y11Y6mDEXiymNjrDkmHmvGWiFLKWu_FA@mail.gmail.com>
	<4ff02295-6c34-791b-49f4-6558a92ad7a3@arm.com>
	<CAAObsKBt1tPw9RKGi_Xey=1zy9Tu3N+A=1te2R8=NuJ5tDBqVg@mail.gmail.com>
	<dc3872a4-8cd9-462b-9f73-0d69a810d985@arm.com>
	<92e9b697-ea0d-9b13-5512-b0a16a39df20@baylibre.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8433455c-3b74-c176-49a1-388b3f085e9e@arm.com>
Date: Wed, 28 Aug 2019 12:49:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <92e9b697-ea0d-9b13-5512-b0a16a39df20@baylibre.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	David Airlie <airlied@linux.ie>, Will Deacon <will.deacon@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Steven Price <steven.price@arm.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
	=?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

SGkgTmVpbCwKCk9uIDI4LzA4LzIwMTkgMTI6MjgsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IEhp
IFJvYmluLAo+IAo+IE9uIDMxLzA1LzIwMTkgMTU6NDcsIFJvYmluIE11cnBoeSB3cm90ZToKPj4g
T24gMzEvMDUvMjAxOSAxMzowNCwgVG9tZXUgVml6b3NvIHdyb3RlOgo+Pj4gT24gV2VkLCAyOSBN
YXkgMjAxOSBhdCAxOTozOCwgUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4gd3Jv
dGU6Cj4+Pj4KPj4+PiBPbiAyOS8wNS8yMDE5IDE2OjA5LCBUb21ldSBWaXpvc28gd3JvdGU6Cj4+
Pj4+IE9uIFR1ZSwgMjEgTWF5IDIwMTkgYXQgMTg6MTEsIENsw6ltZW50IFDDqXJvbiA8cGVyb24u
Y2xlbUBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4gW3NuaXBdCj4+Pj4+PiBbwqAgMzQ1
LjIwNDgxM10gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IG1tdSBpcnEgc3RhdHVzPTEKPj4+Pj4+IFvC
oCAzNDUuMjA5NjE3XSBwYW5mcm9zdCAxODAwMDAwLmdwdTogVW5oYW5kbGVkIFBhZ2UgZmF1bHQg
aW4gQVMwIGF0IFZBCj4+Pj4+PiAweDAwMDAwMDAwMDI0MDA0MDAKPj4+Pj4KPj4+Pj4gIMKgIEZy
b20gd2hhdCBJIGNhbiBzZWUgaGVyZSwgMHgwMDAwMDAwMDAyNDAwNDAwIHBvaW50cyB0byB0aGUg
Zmlyc3QgYnl0ZQo+Pj4+PiBvZiB0aGUgZmlyc3Qgc3VibWl0dGVkIGpvYiBkZXNjcmlwdG9yLgo+
Pj4+Pgo+Pj4+PiBTbyBtYXBwaW5nIGJ1ZmZlcnMgZm9yIHRoZSBHUFUgZG9lc24ndCBzZWVtIHRv
IGJlIHdvcmtpbmcgYXQgYWxsIG9uCj4+Pj4+IDY0LWJpdCBULTc2MC4KPj4+Pj4KPj4+Pj4gU3Rl
dmVuLCBSb2JpbiwgZG8geW91IGhhdmUgYW55IGlkZWEgb2Ygd2h5IHRoaXMgY291bGQgYmU/Cj4+
Pj4KPj4+PiBJIHRyaWVkIHJvbGxpbmcgYmFjayB0byB0aGUgb2xkIHBhbmZyb3N0L25vbmRybSBz
aGltLCBhbmQgaXQgd29ya3MgZmluZQo+Pj4+IHdpdGgga2Jhc2UsIGFuZCBJIGFsc28gZm91bmQg
dGhhdCBULTgyMCBmYWxscyBvdmVyIGluIHRoZSBleGFjdCBzYW1lCj4+Pj4gbWFubmVyLCBzbyB0
aGUgZmFjdCB0aGF0IGl0IHNlZW1lZCB0byBiZSBjb21tb24gdG8gdGhlIHNtYWxsZXIgMzMtYml0
Cj4+Pj4gZGVzaWducyByYXRoZXIgdGhhbiBhbnl0aGluZyB0byBkbyB3aXRoIHRoZSBvdGhlcgo+
Pj4+IGpvYl9kZXNjcmlwdG9yX3NpemUvdjQvdjUgY29tcGxpY2F0aW9uIHR1cm5lZCBvdXQgdG8g
YmUgdGVsbGluZy4KPj4+Cj4+PiBJcyB0aGlzIGNvbXBsaWNhdGlvbiBzb21ldGhpbmcgeW91IGNh
biBleHBsYWluPyBJIGRvbid0IGtub3cgd2hhdCB2NAo+Pj4gYW5kIHY1IGFyZSBtZWFudCBoZXJl
Lgo+Pgo+PiBJIHdhcyBhbGx1ZGluZyB0byBCQVNFX0hXX0ZFQVRVUkVfVjQsIHdoaWNoIEkgYmVs
aWV2ZSByZWZlcnMgdG8gdGhlIE1pZGdhcmQgYXJjaGl0ZWN0dXJlIHZlcnNpb24gLSB0aGUgb2xk
ZXIgdmVyc2lvbnMgaW1wbGVtZW50ZWQgYnkgVDZ4eCBhbmQgVDcyMCBzZWVtIHRvIGJlIGNvbGxl
Y3RpdmVseSB0cmVhdGVkIGFzICJ2NCIsIHdoaWxlIFQ3NjAgYW5kIFQ4eHggd291bGQgZWZmZWN0
aXZlbHkgYmUgInY1Ii4KPj4KPj4+PiBbIGFzIGFuIGFzaWRlLCBhcmUgNjQtYml0IGpvYnMgYWN0
dWFsbHkga25vd24gbm90IHRvIHdvcmsgb24gdjQgR1BVcywgb3IKPj4+PiBpcyBpdCBqdXN0IHRo
YXQgbm9ib2R5J3MgeWV0IG9ic2VydmVkIGEgNjQtYml0IGJsb2IgZHJpdmluZyBvbmU/IF0KPj4+
Cj4+PiBJJ20gbG9va2luZyByaWdodCBub3cgYXQgZ2V0dGluZyBQYW5mcm9zdCB3b3JraW5nIG9u
IFQ3MjAgd2l0aCA2NC1iaXQKPj4+IGRlc2NyaXB0b3JzLCB3aXRoIHRoZSB1bHRpbWF0ZSBnb2Fs
IG9mIG1ha2luZyBQYW5mcm9zdAo+Pj4gNjQtYml0LWRlc2NyaXB0b3Igb25seSBzbyB3ZSBjYW4g
aGF2ZSBhIHNpbmdsZSBidWlsZCBvZiBNZXNhIGluCj4+PiBkaXN0cm9zLgo+Pgo+PiBDb29sLCBJ
J2xsIGtlZXAgYW4gZXllIG91dCwgYW5kIGhvcGUgdGhhdCBpdCBtaWdodCBiZSBlbm91Z2ggZm9y
IFQ2MjAgb24gSnVubywgdG9vIDopCj4+Cj4+Pj4gTG9uZyBzdG9yeSBzaG9ydCwgaXQgYXBwZWFy
cyB0aGF0ICdNYWxpIExQQUUnIGlzIGFsc28gbGFja2luZyB0aGUgc3RhcnQKPj4+PiBsZXZlbCBu
b3Rpb24gb2YgVk1TQSwgYW5kIGV4cGVjdHMgYSBmdWxsIDQtbGV2ZWwgdGFibGUgZXZlbiBmb3Ig
PDQwIGJpdHMKPj4+PiB3aGVuIGxldmVsIDAgZWZmZWN0aXZlbHkgcmVkdW5kYW50LiBUaHVzIHdh
bGtpbmcgdGhlIDMtbGV2ZWwgdGFibGUgdGhhdAo+Pj4+IGlvLXBndGFibGUgY29tZXMgYmFjayB3
aXRoIGVuZHMgdXAgZ29pbmcgd2lsZGx5IHdyb25nLiBUaGUgaGFjayBiZWxvdwo+Pj4+IHNlZW1z
IHRvIGRvIHRoZSBqb2IgZm9yIG1lOyBpZiBDbMOpbWVudCBjYW4gY29uZmlybSAob24gVC03MjAg
eW91J2xsCj4+Pj4gc3RpbGwgbmVlZCB0aGUgdXNlcnNwYWNlIGhhY2sgdG8gZm9yY2UgMzItYml0
IGpvYnMgYXMgd2VsbCkgdGhlbiBJIHRoaW5rCj4+Pj4gSSdsbCBjb29rIHVwIGEgcHJvcGVyIHJl
ZmFjdG9yaW5nIG9mIHRoZSBhbGxvY2F0b3IgdG8gcHV0IHRoaW5ncyByaWdodC4KPj4+Cj4+PiBN
bWFwcyBzZWVtIHRvIHdvcmsgd2l0aCB0aGlzIHBhdGNoLCB0aGFua3MuCj4+Pgo+Pj4gVGhlIG1h
aW4gY29tcGxpY2F0aW9uIEknbSBmYWNpbmcgcmlnaHQgbm93IHNlZW1zIHRvIGJlIHRoYXQgdGhl
IFNGQkQKPj4+IGRlc2NyaXB0b3Igb24gVDcyMCBzZWVtcyB0byBiZSBkaWZmZXJlbnQgZnJvbSB0
aGUgb25lIHdlIGFscmVhZHkgaGFkCj4+PiAodGVzdGVkIG9uIFQ2eHg/KS4KPj4KPj4gT0sgLSB3
aXRoIHRoZSAzMi1iaXQgaGFjayBwb2ludGVkIHRvIHVwLXRocmVhZCwgYSBxdWljayBrbXNjdWJl
IHRlc3QgZ2F2ZSBtZSB0aGUgaW1wcmVzc2lvbiB0aGF0IFQ3MjAgd29ya3MgZmluZSwgYnV0IG9u
IGNsb3NlciBpbnNwZWN0aW9uIHNvbWUgcGFydHMgb2YgZ2xtYXJrMiBkbyBzZWVtIHRvIGdvIGEg
Yml0IHdvbmt5IChhbHRob3VnaCBJIHN1c3BlY3QgYXQgbGVhc3Qgc29tZSBvZiBpdCBpcyBqdXN0
IGRvd24gdG8gdGhlIEZQR0Egc2V0dXAgYmVpbmcgYm90aCB2ZXJ5IHNsb3cgYW5kIGxhY2tpbmcg
aW4gbWVtb3J5IGJhbmR3aWR0aCksIGFuZCB0aGUgIm52MTItMWltZyIgbW9kZSBvZiBrbXNjdWJl
IHR1cm5zIG91dCB0byByZW5kZXIgaW4gc29tZSBkZWxpZ2h0ZnVsbHkgd3JvbmcgY29sb3Vycy4K
Pj4KPj4gSSdsbCB0cnkgdG8gZ2V0IGEgJ3Byb3BlcicgdmVyc2lvbiBvZiB0aGUgaW8tcGd0YWJs
ZSBwYXRjaCBwb3N0ZWQgc29vbi4KPiAKPiBJJ20gdHJ5aW5nIHRvIGNvbGxlY3QgYWxsIHRoZSBm
aXhlcyBuZWVkZWQgdG8gbWFrZSBUODIwIHdvcmsgYWdhaW4sIGFuZAo+IEkgd2FzIHdvbmRlcmlu
ZyBpZiB5b3UgZmluYWxseSBoYXZlIGEgcHJvcGVyIHBhdGNoIGZvciB0aGlzIGFuZCAiY2ZnLT5p
YXMgPiA0OCIKPiBoYWNrID8gT3Igb25lIEkgY2FuIHRlc3QgPwoKSSBkbyBoYXZlIGEgaGFuZGZ1
bCBvZiBpby1wZ3RhYmxlIHBhdGNoZXMgd3JpdHRlbiB1cCBhbmQgcmVhZHkgdG8gZ28sIApJJ20g
anVzdCB0cmVhZGluZyBjYXJlZnVsbHkgYW5kIHdhaXRpbmcgZm9yIHRoZSBpbnRlcm5hbCBhcHBy
b3ZhbCBib3ggdG8gCmJlIHRpY2tlZCBiZWZvcmUgSSBzaGFyZSBhbnl0aGluZyA6KAoKUm9iaW4u
Cgo+IAo+IFRoYW5rcywKPiBOZWlsCj4gCj4+Cj4+IFRoYW5rcywKPj4gUm9iaW4uCj4+Cj4+Pgo+
Pj4gQ2hlZXJzLAo+Pj4KPj4+IFRvbWV1Cj4+Pgo+Pj4+IFJvYmluLgo+Pj4+Cj4+Pj4KPj4+PiAt
LS0tLT44LS0tLS0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFy
bS5jIGIvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jCj4+Pj4gaW5kZXggNTQ2OTY4ZDhh
MzQ5Li5mMjlkYTZlOGRjMDggMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9pby1wZ3Rh
YmxlLWFybS5jCj4+Pj4gKysrIGIvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jCj4+Pj4g
QEAgLTEwMjMsMTIgKzEwMjMsMTQgQEAgYXJtX21hbGlfbHBhZV9hbGxvY19wZ3RhYmxlKHN0cnVj
dAo+Pj4+IGlvX3BndGFibGVfY2ZnICpjZmcsIHZvaWQgKmNvb2tpZSkKPj4+PiAgwqDCoMKgwqDC
oMKgwqDCoCBpb3AgPSBhcm1fNjRfbHBhZV9hbGxvY19wZ3RhYmxlX3MxKGNmZywgY29va2llKTsK
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaW9wKSB7Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHU2NCBtYWlyLCB0dGJyOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBhcm1fbHBhZV9pb19wZ3RhYmxlICpkYXRhID0gaW9fcGd0YWJsZV9v
cHNfdG9fZGF0YSgmaW9wLT5vcHMpOwo+Pj4+Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZGF0YS0+bGV2ZWxzID0gNDsKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLyogQ29weSB2YWx1ZXMgYXMgdW5pb24gZmllbGRzIG92ZXJsYXAgKi8KPj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFpciA9IGNmZy0+YXJtX2xwYWVfczFfY2Zn
Lm1haXJbMF07Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR0YnIgPSBj
ZmctPmFybV9scGFlX3MxX2NmZy50dGJyWzBdOwo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4+Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdApp
b21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
