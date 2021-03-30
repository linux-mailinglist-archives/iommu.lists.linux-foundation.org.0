Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6B434E5AE
	for <lists.iommu@lfdr.de>; Tue, 30 Mar 2021 12:46:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47FD883D74;
	Tue, 30 Mar 2021 10:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMkQUMXiQ6xn; Tue, 30 Mar 2021 10:46:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 630F883D78;
	Tue, 30 Mar 2021 10:46:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43ED4C0011;
	Tue, 30 Mar 2021 10:46:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BE06C000A
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 10:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6534A83D78
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 10:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JhwnO-KXPPak for <iommu@lists.linux-foundation.org>;
 Tue, 30 Mar 2021 10:46:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1791783D74
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 10:46:16 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F8mK253Xhz9s0k;
 Tue, 30 Mar 2021 18:44:06 +0800 (CST)
Received: from [127.0.0.1] (10.40.193.166) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Tue, 30 Mar 2021
 18:46:08 +0800
Subject: Re: [PATCH] iommu: Add a check to avoid invalid iotlb sync
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
References: <1616826190-77035-1-git-send-email-chenxiang66@hisilicon.com>
 <20210329144554.GA4203@willie-the-truck>
 <2b0b7a7d-7162-bef9-9730-cbe3767d14f9@hisilicon.com>
 <f4c1cc18-6b5a-575b-92ee-fc4357d72d17@arm.com>
 <20210330092523.GA5050@willie-the-truck>
From: "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <fa908314-bc16-9743-021a-c6eb4b7c179f@hisilicon.com>
Date: Tue, 30 Mar 2021 18:46:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20210330092523.GA5050@willie-the-truck>
X-Originating-IP: [10.40.193.166]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linuxarm@openeuler.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

CgrlnKggMjAyMS8zLzMwIDE3OjI1LCBXaWxsIERlYWNvbiDlhpnpgZM6Cj4gT24gVHVlLCBNYXIg
MzAsIDIwMjEgYXQgMTA6MDQ6NTNBTSArMDEwMCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+PiBPbiAy
MDIxLTAzLTMwIDAyOjIyLCBjaGVueGlhbmcgKE0pIHdyb3RlOgo+Pj4gSGkgV2lsbCwKPj4+Cj4+
Pgo+Pj4g5ZyoIDIwMjEvMy8yOSAyMjo0NSwgV2lsbCBEZWFjb24g5YaZ6YGTOgo+Pj4+IE9uIFNh
dCwgTWFyIDI3LCAyMDIxIGF0IDAyOjIzOjEwUE0gKzA4MDAsIGNoZW54aWFuZyB3cm90ZToKPj4+
Pj4gRnJvbTogWGlhbmcgQ2hlbiA8Y2hlbnhpYW5nNjZAaGlzaWxpY29uLmNvbT4KPj4+Pj4KPj4+
Pj4gQ3VycmVudGx5IGl0IHdpbGwgc2VuZCBhIGlvdGxiIHN5bmMgYXQgZW5kIG9mIGlvbW11IHVu
bWFwIGV2ZW4gaWYKPj4+Pj4gaW90bGJfZ2F0aGVyIGlzIG5vdCB2YWxpZCAoaW90bGJfZ2F0aGVy
LT5wZ3NpemUgPSAwKS4gQWN0dWFsbHkgaXQgaXMgbm90Cj4+Pj4+IG5lY2Vzc2FyeSwgc28gYWRk
IGEgY2hlY2sgdG8gYXZvaWQgaW52YWxpZCBpb3RsYiBzeW5jLgo+Pj4+Pgo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBYaWFuZyBDaGVuIDxjaGVueGlhbmc2NkBoaXNpbGljb24uY29tPgo+Pj4+PiAtLS0K
Pj4+Pj4gICAgaW5jbHVkZS9saW51eC9pb21tdS5oIHwgMyArKysKPj4+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9pb21tdS5oIGIvaW5jbHVkZS9saW51eC9pb21tdS5oCj4+Pj4+IGluZGV4IDljYTZlNmIu
LjZhZmE2MWIgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvaW9tbXUuaAo+Pj4+PiAr
KysgYi9pbmNsdWRlL2xpbnV4L2lvbW11LmgKPj4+Pj4gQEAgLTUyOSw2ICs1MjksOSBAQCBzdGF0
aWMgaW5saW5lIHZvaWQKPj4+Pj4gaW9tbXVfZmx1c2hfaW90bGJfYWxsKHN0cnVjdCBpb21tdV9k
b21haW4gKmRvbWFpbikKPj4+Pj4gICAgc3RhdGljIGlubGluZSB2b2lkIGlvbW11X2lvdGxiX3N5
bmMoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLAo+Pj4+PiAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgaW9tbXVfaW90bGJfZ2F0aGVyICppb3RsYl9nYXRoZXIpCj4+Pj4+ICAgIHsKPj4+
Pj4gKyAgICBpZiAoIWlvdGxiX2dhdGhlci0+cGdzaXplKQo+Pj4+PiArICAgICAgICByZXR1cm47
Cj4+Pj4gSW4gd2hpY2ggY2lyY3Vtc3RhbmNlcyBkb2VzIHRoaXMgb2NjdXI/Cj4+Pj4KPj4+PiBX
aWxsCj4+PiBXaGVuIGlvbW11X3VubWFwLCBpdCBpbml0aWFsaXplcyBpb3RsYl9nYXRoZXIgKHRo
ZW4gaW90bGJfZ2F0aGVyLT5wZ3NpemUKPj4+ID0gMCkuCj4+PiBJZiB0aGUgdW5tYXAgc2l6ZSA9
IEFSTV9MUEFFX0JMT0NLX1NJWkUobHZsKSAmJiBpb3B0ZV9sZWFmKCksIGl0IHdpbGwKPj4+IGZp
bGwgdGhlIGlvdGxiX2dhdGhlciAoc2V0IGlvdGxiX2dhdGhlci0+cGdzaXplID0gZ3JhbnVsZSk7
Cj4+PiBidXQgaWYgdGhlIHVubWFwIHNpemUgPSBBUk1fTFBBRV9CTE9DS19TSVpFKGx2bCkgJiYg
IWlvcHRlX2xlYWYoKSAodGxiCj4+PiBmbHVzaCB3YWxrIHNpdHVhdGlvbiksIGlvdGxiX2dhdGhl
ciBpcyBub3QgZmlsbGVkIChpb3RsYl9nYXRoZXItPnBnc2l6ZQo+Pj4gPSAwKSwKPj4+IGl0IHdp
bGwgc3RpbGwgc2VuZCBpb21tdV9pb3RsYl9zeW5jKGRvbWFpbiwgJmlvdGxiX2dhdGhlcikgd2hp
Y2ggaXMKPj4+IGFjdHVhbGx5IGludmFsaWQgaW90bGIgc3luYyBhdCBsYXN0Lgo+PiBJIGd1ZXNz
IHRoaXMgY2FuIGhhcHBlbiBpbiBETUEgQVBJIHVzYWdlIGlmIHdlJ3ZlIHByZXZpb3VzbHkgbWFw
cGVkIGEKPj4gYmxvY2sncyB3b3J0aCBvZiBzY2F0dGVybGlzdCBwYWdlcyBpbnRvIGEgYmxvY2st
PXNpemVkIElPVkEgcmVnaW9uLCBidXQgdGhpcwo+PiBpcyBub3QgdGhlIHBsYWNlIHRvIGRvIGFu
eXRoaW5nIGFib3V0IGl0LiBUaGUgbWFpbiB0aGluZyB0aGlzIHBhdGNoIHdpbGwgZG8KPj4gaXMg
YnJlYWsgYWxsIHRoZSBvdGhlciBkcml2ZXJzIHRoYXQgaW1wbGVtZW50IC5pb3RsYl9zeW5jIGJ1
dCBkbyBub3QgdXNlCj4+IGlvdGxiX2dhdGhlci4KPj4KPj4gQnkgYWxsIG1lYW5zIG9wdGltaXNl
IFNNTVV2MydzIHN5bmMgYmVoYXZpb3VyLCBidXQgdGhlIG9ubHkgdmFsaWQgcGxhY2UgdG8KPj4g
ZG8gdGhhdCBpcyBpbiBTTU1VdjMncyBvd24gc3luYyBjYWxsYmFjay4gVGhlc2UgcGFydGljdWxh
ciBkZXRhaWxzIGFyZQo+PiBiZXlvbmQgd2hhdCB0aGUgSU9NTVUgY29yZSBrbm93cyBhYm91dC4K
PiBZZXMsIHRoYXQncyB3aGVyZSBJIHdhcyBoZWFkaW5nLiBDaGVueGlhbmcsIHBsZWFzZSBjb3Vs
ZCB5b3Ugc2VuZCBhIHYyCj4gd2l0aCB0aGUgY2hlY2sgaW5zaWRlIGFybV9zbW11X2lvdGxiX3N5
bmMoKSBpbnN0ZWFkPwoKT2ssIHRoYW5rcywgaSB3aWxsIHNlbmQgYSB2MiBsYXRlci4KCj4KPiBU
aGFua3MsCj4KPiBXaWxsCj4KPiAuCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vaW9tbXU=
