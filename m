Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D25735E8D6
	for <lists.iommu@lfdr.de>; Wed, 14 Apr 2021 00:11:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 440306072F;
	Tue, 13 Apr 2021 22:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NEZVGBxQBXc; Tue, 13 Apr 2021 22:11:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id C473B60713;
	Tue, 13 Apr 2021 22:11:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9492EC0012;
	Tue, 13 Apr 2021 22:11:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 535FAC000A
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 22:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BC1440153
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 22:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uKDjyCe24P56 for <iommu@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 22:11:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D65194011B
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 22:10:59 +0000 (UTC)
IronPort-SDR: F85tDpteqUq0zMZoCxUaKZVJcPXmhoXo4ZB9xzRyBNMnd3JLwlSWZCxE328TG5xMUeOEnCDKdM
 swZrNEZ+EQ8g==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="191326585"
X-IronPort-AV: E=Sophos;i="5.82,220,1613462400"; d="scan'208";a="191326585"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 15:10:52 -0700
IronPort-SDR: PcrUGVrp3ypt2/I5BikVoQc8TzVWCqOtPCHopNNuzeXZ/CIyem29B9s8C6W1P1/RjJ2PT0HCWt
 6g/TvFr12KCw==
X-IronPort-AV: E=Sophos;i="5.82,220,1613462400"; d="scan'208";a="424438930"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 15:10:52 -0700
Date: Tue, 13 Apr 2021 15:13:30 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/2] iommu/sva: Tighten SVA bind API with explicit flags
Message-ID: <20210413151330.2fa6325c@jacob-builder>
In-Reply-To: <a015f183-7965-60d8-6f8a-646cb47e5eb6@linux.intel.com>
References: <1617901736-24788-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <a015f183-7965-60d8-6f8a-646cb47e5eb6@linux.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: vkoul@kernel.org, "Tian, Kevin" <kevin.tian@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jason Gunthorpe <jgg@nvidia.com>, zhangfei.gao@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SGkgQmFvbHUsClRoYW5rcyBmb3IgdGhlIHZpZXcuCgpPbiBGcmksIDkgQXByIDIwMjEgMjA6MjQ6
MjIgKzA4MDAsIEx1IEJhb2x1IDxiYW9sdS5sdUBsaW51eC5pbnRlbC5jb20+Cndyb3RlOgoKPiBI
aSBKYWNvYiwKPiAKPiBPbiAyMDIxLzQvOSAxOjA4LCBKYWNvYiBQYW4gd3JvdGU6Cj4gPiBUaGUg
dm9pZCogZHJ2ZGF0YSBwYXJhbWV0ZXIgaXNuJ3QgcmVhbGx5IHVzZWQgaW7CoGlvbW11X3N2YV9i
aW5kX2RldmljZSgpCj4gPiBBUEksIHRoZSBjdXJyZW50IElEWEQgY29kZSAiYm9ycm93cyIgdGhl
IGRydmRhdGEgZm9yIGEgVlQtZCBwcml2YXRlIGZsYWcKPiA+IGZvciBzdXBlcnZpc29yIFNWQSB1
c2FnZS4KPiA+IAo+ID4gU3VwZXJ2aXNvci9Qcml2aWxlZ2VkIG1vZGUgcmVxdWVzdCBpcyBhIGdl
bmVyaWMgZmVhdHVyZS4gSXQgc2hvdWxkIGJlCj4gPiBwcm9tb3RlZCBmcm9tIHRoZSBWVC1kIHZl
bmRvciBkcml2ZXIgdG8gdGhlIGdlbmVyaWMgY29kZS4KPiA+IAo+ID4gVGhpcyBwYXRjaCByZXBs
YWNlcyB2b2lkKiBkcnZkYXRhIHdpdGggYSB1bnNpZ25lZCBpbnQgZmxhZ3MgcGFyYW1ldGVyCj4g
PiBhbmQgYWRqdXN0cyBjYWxsZXJzIGFjY29yZGluZ2x5Lgo+ID4gCj4gPiBMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS9ZRmhpTUxSMzVXV01XJTJGSHVAbXlyaWNhLwo+
ID4gU3VnZ2VzdGVkLWJ5OiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgPGplYW4tcGhpbGlwcGVAbGlu
YXJvLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEphY29iIFBhbiA8amFjb2IuanVuLnBhbkBsaW51
eC5pbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9kbWEvaWR4ZC9jZGV2LmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ID4gICBkcml2ZXJzL2RtYS9pZHhkL2luaXQuYyAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKy0tLQo+ID4gICBkcml2ZXJzL2lvbW11L2Fy
bS9hcm0tc21tdS12My9hcm0tc21tdS12My1zdmEuYyB8ICAyICstCj4gPiAgIGRyaXZlcnMvaW9t
bXUvYXJtL2FybS1zbW11LXYzL2FybS1zbW11LXYzLmggICAgIHwgIDQgKystLQo+ID4gICBkcml2
ZXJzL2lvbW11L2ludGVsL0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICAg
ZHJpdmVycy9pb21tdS9pbnRlbC9zdm0uYyAgICAgICAgICAgICAgICAgICAgICAgfCAxOAo+ID4g
KysrKysrLS0tLS0tLS0tLS0tIGRyaXZlcnMvaW9tbXUvaW9tbXUuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDkKPiA+ICsrKysrKy0tLSBkcml2ZXJzL21pc2MvdWFjY2UvdWFjY2UuYyAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgIGluY2x1ZGUvbGludXgvaW50ZWwtaW9t
bXUuaCAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICAgaW5jbHVkZS9saW51eC9pbnRl
bC1zdm0uaCAgICAgICAgICAgICAgICAgICAgICAgfCAxNyArKy0tLS0tLS0tLS0tLS0tLQo+ID4g
ICBpbmNsdWRlL2xpbnV4L2lvbW11LmggICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE5Cj4g
PiArKysrKysrKysrKysrKysrLS0tIDExIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyks
IDQyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEvaWR4ZC9j
ZGV2LmMgYi9kcml2ZXJzL2RtYS9pZHhkL2NkZXYuYwo+ID4gaW5kZXggMGRiOWI4Mi4uMjFlYzgy
YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZG1hL2lkeGQvY2Rldi5jCj4gPiArKysgYi9kcml2
ZXJzL2RtYS9pZHhkL2NkZXYuYwo+ID4gQEAgLTEwMyw3ICsxMDMsNyBAQCBzdGF0aWMgaW50IGlk
eGRfY2Rldl9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4gPiBzdHJ1Y3QgZmlsZSAqZmlscCkg
ZmlscC0+cHJpdmF0ZV9kYXRhID0gY3R4Owo+ID4gICAKPiA+ICAgCWlmIChkZXZpY2VfcGFzaWRf
ZW5hYmxlZChpZHhkKSkgewo+ID4gLQkJc3ZhID0gaW9tbXVfc3ZhX2JpbmRfZGV2aWNlKGRldiwg
Y3VycmVudC0+bW0sIE5VTEwpOwo+ID4gKwkJc3ZhID0gaW9tbXVfc3ZhX2JpbmRfZGV2aWNlKGRl
diwgY3VycmVudC0+bW0sIDApOwo+ID4gICAJCWlmIChJU19FUlIoc3ZhKSkgewo+ID4gICAJCQly
YyA9IFBUUl9FUlIoc3ZhKTsKPiA+ICAgCQkJZGV2X2VycihkZXYsICJwYXNpZCBhbGxvY2F0aW9u
IGZhaWxlZDogJWRcbiIsCj4gPiByYyk7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS9pZHhkL2lu
aXQuYyBiL2RyaXZlcnMvZG1hL2lkeGQvaW5pdC5jCj4gPiBpbmRleCAwODVhMGMzLi5jZGM4NWYx
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9kbWEvaWR4ZC9pbml0LmMKPiA+ICsrKyBiL2RyaXZl
cnMvZG1hL2lkeGQvaW5pdC5jCj4gPiBAQCAtMzAwLDEzICszMDAsMTMgQEAgc3RhdGljIHN0cnVj
dCBpZHhkX2RldmljZSAqaWR4ZF9hbGxvYyhzdHJ1Y3QKPiA+IHBjaV9kZXYgKnBkZXYpIAo+ID4g
ICBzdGF0aWMgaW50IGlkeGRfZW5hYmxlX3N5c3RlbV9wYXNpZChzdHJ1Y3QgaWR4ZF9kZXZpY2Ug
KmlkeGQpCj4gPiAgIHsKPiA+IC0JaW50IGZsYWdzOwo+ID4gKwl1bnNpZ25lZCBpbnQgZmxhZ3M7
Cj4gPiAgIAl1bnNpZ25lZCBpbnQgcGFzaWQ7Cj4gPiAgIAlzdHJ1Y3QgaW9tbXVfc3ZhICpzdmE7
Cj4gPiAgIAo+ID4gLQlmbGFncyA9IFNWTV9GTEFHX1NVUEVSVklTT1JfTU9ERTsKPiA+ICsJZmxh
Z3MgPSBJT01NVV9TVkFfQklORF9TVVBFUlZJU09SOyAgCj4gCj4gV2l0aCBTVk1fRkxBR19TVVBF
UlZJU09SX01PREUgcmVtb3ZlZCwgSSBndWVzcwo+IAo+ICNpbmNsdWRlIDxsaW51eC9pbnRlbC1z
dm0uaD4KPiAKPiBpbiB0aGlzIGZpbGUgY291bGQgYmUgcmVtb3ZlZCBhcyB3ZWxsLgp5ZXMsIGdv
b2QgcG9pbnQuCgo+IAo+ID4gICAKPiA+IC0Jc3ZhID0gaW9tbXVfc3ZhX2JpbmRfZGV2aWNlKCZp
ZHhkLT5wZGV2LT5kZXYsIE5VTEwsICZmbGFncyk7Cj4gPiArCXN2YSA9IGlvbW11X3N2YV9iaW5k
X2RldmljZSgmaWR4ZC0+cGRldi0+ZGV2LCBOVUxMLCBmbGFncyk7Cj4gPiAgIAlpZiAoSVNfRVJS
KHN2YSkpIHsKPiA+ICAgCQlkZXZfd2FybigmaWR4ZC0+cGRldi0+ZGV2LAo+ID4gICAJCQkgImlv
bW11IHN2YSBiaW5kIGZhaWxlZDogJWxkXG4iLAo+ID4gUFRSX0VSUihzdmEpKTsgZGlmZiAtLWdp
dAo+ID4gYS9kcml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS12My9hcm0tc21tdS12My1zdmEuYwo+
ID4gYi9kcml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS12My9hcm0tc21tdS12My1zdmEuYyBpbmRl
eAo+ID4gYmIyNTFjYS4uMjNlMjg3ZSAxMDA2NDQgLS0tCj4gPiBhL2RyaXZlcnMvaW9tbXUvYXJt
L2FybS1zbW11LXYzL2FybS1zbW11LXYzLXN2YS5jICsrKwo+ID4gYi9kcml2ZXJzL2lvbW11L2Fy
bS9hcm0tc21tdS12My9hcm0tc21tdS12My1zdmEuYyBAQCAtMzU0LDcgKzM1NCw3IEBACj4gPiBf
X2FybV9zbW11X3N2YV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG1tX3N0cnVjdCAq
bW0pIH0gCj4gPiAgIHN0cnVjdCBpb21tdV9zdmEgKgo+ID4gLWFybV9zbW11X3N2YV9iaW5kKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG1tX3N0cnVjdCAqbW0sIHZvaWQKPiA+ICpkcnZkYXRh
KSArYXJtX3NtbXVfc3ZhX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbW1fc3RydWN0
ICptbSwKPiA+IHVuc2lnbmVkIGludCBmbGFncykgewo+ID4gICAJc3RydWN0IGlvbW11X3N2YSAq
aGFuZGxlOwo+ID4gICAJc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluID0gaW9tbXVfZ2V0X2Rv
bWFpbl9mb3JfZGV2KGRldik7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9hcm0vYXJt
LXNtbXUtdjMvYXJtLXNtbXUtdjMuaAo+ID4gYi9kcml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS12
My9hcm0tc21tdS12My5oIGluZGV4IGY5ODU4MTcuLmI5NzFkNGQKPiA+IDEwMDY0NCAtLS0gYS9k
cml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS12My9hcm0tc21tdS12My5oCj4gPiArKysgYi9kcml2
ZXJzL2lvbW11L2FybS9hcm0tc21tdS12My9hcm0tc21tdS12My5oCj4gPiBAQCAtNzExLDcgKzcx
MSw3IEBAIGJvb2wgYXJtX3NtbXVfbWFzdGVyX3N2YV9lbmFibGVkKHN0cnVjdAo+ID4gYXJtX3Nt
bXVfbWFzdGVyICptYXN0ZXIpOyBpbnQgYXJtX3NtbXVfbWFzdGVyX2VuYWJsZV9zdmEoc3RydWN0
Cj4gPiBhcm1fc21tdV9tYXN0ZXIgKm1hc3Rlcik7IGludCBhcm1fc21tdV9tYXN0ZXJfZGlzYWJs
ZV9zdmEoc3RydWN0Cj4gPiBhcm1fc21tdV9tYXN0ZXIgKm1hc3Rlcik7IHN0cnVjdCBpb21tdV9z
dmEgKmFybV9zbW11X3N2YV9iaW5kKHN0cnVjdAo+ID4gZGV2aWNlICpkZXYsIHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLAo+ID4gLQkJCQkgICAgdm9pZCAqZHJ2ZGF0YSk7Cj4gPiArCQkJCSAgICB1bnNp
Z25lZCBpbnQgZmxhZ3MpOwo+ID4gICB2b2lkIGFybV9zbW11X3N2YV91bmJpbmQoc3RydWN0IGlv
bW11X3N2YSAqaGFuZGxlKTsKPiA+ICAgdTMyIGFybV9zbW11X3N2YV9nZXRfcGFzaWQoc3RydWN0
IGlvbW11X3N2YSAqaGFuZGxlKTsKPiA+ICAgdm9pZCBhcm1fc21tdV9zdmFfbm90aWZpZXJfc3lu
Y2hyb25pemUodm9pZCk7Cj4gPiBAQCAtNzQyLDcgKzc0Miw3IEBAIHN0YXRpYyBpbmxpbmUgaW50
Cj4gPiBhcm1fc21tdV9tYXN0ZXJfZGlzYWJsZV9zdmEoc3RydWN0IGFybV9zbW11X21hc3RlciAq
bWFzdGVyKSB9Cj4gPiAgIAo+ID4gICBzdGF0aWMgaW5saW5lIHN0cnVjdCBpb21tdV9zdmEgKgo+
ID4gLWFybV9zbW11X3N2YV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG1tX3N0cnVj
dCAqbW0sIHZvaWQKPiA+ICpkcnZkYXRhKSArYXJtX3NtbXVfc3ZhX2JpbmQoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiA+IHVuc2lnbmVkIGludCBmbGFncykgewo+
ID4gICAJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4gPiAgIH0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lvbW11L2ludGVsL0tjb25maWcgYi9kcml2ZXJzL2lvbW11L2ludGVsL0tjb25maWcK
PiA+IGluZGV4IDI4YTNkMTUuLjU0MTUwNTIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11
L2ludGVsL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvaW50ZWwvS2NvbmZpZwo+ID4g
QEAgLTQxLDYgKzQxLDcgQEAgY29uZmlnIElOVEVMX0lPTU1VX1NWTQo+ID4gICAJc2VsZWN0IFBD
SV9QUkkKPiA+ICAgCXNlbGVjdCBNTVVfTk9USUZJRVIKPiA+ICAgCXNlbGVjdCBJT0FTSUQKPiA+
ICsJc2VsZWN0IElPTU1VX1NWQV9MSUIgIAo+IAo+IFdoeT8KUmlnaHQsIG5vdCBuZWVkZWQuIFZU
LWQgaXMgbm90IHVzaW5nIGlvbW11X3N2YV9hbGxvYy9mcmVlX3Bhc2lkKCkgeWV0LiBJIHdhcwp1
bmRlciB0aGUgd3JvbmcgaW1wcmVzc2lvbiB0aGF0IGlvbW11X3N2YV9iaW5kX2RldmljZSBpcyBw
YXJ0IG9mIHRoZQpzdmEtbGliLgoKPiAKPiA+ICAgCWhlbHAKPiA+ICAgCSAgU2hhcmVkIFZpcnR1
YWwgTWVtb3J5IChTVk0pIHByb3ZpZGVzIGEgZmFjaWxpdHkgZm9yIGRldmljZXMKPiA+ICAgCSAg
dG8gYWNjZXNzIERNQSByZXNvdXJjZXMgdGhyb3VnaCBwcm9jZXNzIGFkZHJlc3Mgc3BhY2UgYnkK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2ludGVsL3N2bS5jIGIvZHJpdmVycy9pb21t
dS9pbnRlbC9zdm0uYwo+ID4gaW5kZXggNTc0YTdlNi4uNGI1ZjhiMCAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvaW9tbXUvaW50ZWwvc3ZtLmMKPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvaW50ZWwv
c3ZtLmMKPiA+IEBAIC00ODYsMTIgKzQ4Niw5IEBAIGludGVsX3N2bV9iaW5kX21tKHN0cnVjdCBk
ZXZpY2UgKmRldiwgdW5zaWduZWQgaW50Cj4gPiBmbGFncywgfSBlbHNlCj4gPiAgIAkJcGFzaWRf
bWF4ID0gMSA8PCAyMDsKPiA+ICAgCj4gPiAtCS8qIEJpbmQgc3VwZXJ2aXNvciBQQVNJRCBzaHVs
ZCBoYXZlIG1tID0gTlVMTCAqLwo+ID4gLQlpZiAoZmxhZ3MgJiBTVk1fRkxBR19TVVBFUlZJU09S
X01PREUpIHsKPiA+IC0JCWlmICghZWNhcF9zcnMoaW9tbXUtPmVjYXApIHx8IG1tKSB7Cj4gPiAt
CQkJcHJfZXJyKCJTdXBlcnZpc29yIFBBU0lEIHdpdGggdXNlciBwcm92aWRlZAo+ID4gbW0uXG4i
KTsKPiA+IC0JCQlyZXR1cm4gLUVJTlZBTDsKPiA+IC0JCX0KPiA+ICsJaWYgKChmbGFncyAmIElP
TU1VX1NWQV9CSU5EX1NVUEVSVklTT1IpICYmCj4gPiAhZWNhcF9zcnMoaW9tbXUtPmVjYXApKSB7
Cj4gPiArCQlwcl9lcnIoIlN1cGVydmlzb3IgUEFTSUQgbm90IHN1cHBvcnRlZC5cbiIpOwo+ID4g
KwkJcmV0dXJuIC1FSU5WQUw7Cj4gPiAgIAl9Cj4gPiAgIAo+ID4gICAJaWYgKCEoZmxhZ3MgJiBT
Vk1fRkxBR19QUklWQVRFX1BBU0lEKSkgewo+ID4gQEAgLTU5Myw3ICs1OTAsNyBAQCBpbnRlbF9z
dm1fYmluZF9tbShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludAo+ID4gZmxhZ3MsIHJl
dCA9IGludGVsX3Bhc2lkX3NldHVwX2ZpcnN0X2xldmVsKGlvbW11LCBkZXYsCj4gPiAgIAkJCQlt
bSA/IG1tLT5wZ2QgOiBpbml0X21tLnBnZCwKPiA+ICAgCQkJCXN2bS0+cGFzaWQsIEZMUFRfREVG
QVVMVF9ESUQsCj4gPiAtCQkJCShtbSA/IDAgOiBQQVNJRF9GTEFHX1NVUEVSVklTT1JfTU9ERSkg
fAo+ID4gKwkJCQkobW0gPyAwIDogSU9NTVVfU1ZBX0JJTkRfU1VQRVJWSVNPUikgfAo+ID4gIAo+
IAo+IE5PLiBQQVNJRF9GTEFHX1NVUEVSVklTT1JfTU9ERSBpcyBhbiBpbnRlcm5hbCBmbGFnIHRv
IHRlbGwgdGhlIGhlbHBlcgo+IHdoZXRoZXIgdGhlIFNSRSBiaXQgc2hvdWxkIGJlIHNldCBpbiB0
aGUgUEFTSUQgZW50cnkuCj4gCk9LLCB3aWxsIGtlZXAgdGhlbSBzZXBhcmF0ZS4KCj4gPiAgIAkJ
CQkoY3B1X2ZlYXR1cmVfZW5hYmxlZChYODZfRkVBVFVSRV9MQTU3KQo+ID4gPyBQQVNJRF9GTEFH
X0ZMNUxQIDogMCkpOwo+ID4gICAJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmlvbW11LT5sb2Nr
LCBpZmxhZ3MpOwo+ID4gQEAgLTYyMCw3ICs2MTcsNyBAQCBpbnRlbF9zdm1fYmluZF9tbShzdHJ1
Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludAo+ID4gZmxhZ3MsIHJldCA9IGludGVsX3Bhc2lk
X3NldHVwX2ZpcnN0X2xldmVsKGlvbW11LCBkZXYsCj4gPiAgIAkJCQkJCW1tID8gbW0tPnBnZCA6
Cj4gPiBpbml0X21tLnBnZCwgc3ZtLT5wYXNpZCwgRkxQVF9ERUZBVUxUX0RJRCwKPiA+IC0JCQkJ
CQkobW0gPyAwIDoKPiA+IFBBU0lEX0ZMQUdfU1VQRVJWSVNPUl9NT0RFKSB8Cj4gPiArCQkJCQkJ
KG1tID8gMCA6Cj4gPiBJT01NVV9TVkFfQklORF9TVVBFUlZJU09SKSB8ICAKPiAKPiBUaGUgc2Ft
ZSBhcyBhYm92ZS4KPiAKZ290IGl0LgoKPiA+ICAgCQkJCQkJKGNwdV9mZWF0dXJlX2VuYWJsZWQo
WDg2X0ZFQVRVUkVfTEE1NykKPiA+ID8gUEFTSURfRkxBR19GTDVMUCA6IDApKTsKPiA+ICAgCQlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZpb21tdS0+bG9jaywgaWZsYWdzKTsKPiA+IEBAIC0xMDU5
LDExICsxMDU2LDEwIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBwcnFfZXZlbnRfdGhyZWFkKGludCBp
cnEsCj4gPiB2b2lkICpkKSAKPiA+ICAgI2RlZmluZSB0b19pbnRlbF9zdm1fZGV2KGhhbmRsZSkg
Y29udGFpbmVyX29mKGhhbmRsZSwgc3RydWN0Cj4gPiBpbnRlbF9zdm1fZGV2LCBzdmEpIHN0cnVj
dCBpb21tdV9zdmEgKgo+ID4gLWludGVsX3N2bV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sIHZvaWQgKmRydmRhdGEpCj4gPiAraW50ZWxfc3ZtX2JpbmQoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgaW50Cj4gPiBm
bGFncykgewo+ID4gICAJc3RydWN0IGlvbW11X3N2YSAqc3ZhID0gRVJSX1BUUigtRUlOVkFMKTsK
PiA+ICAgCXN0cnVjdCBpbnRlbF9zdm1fZGV2ICpzZGV2ID0gTlVMTDsKPiA+IC0JdW5zaWduZWQg
aW50IGZsYWdzID0gMDsKPiA+ICAgCWludCByZXQ7Cj4gPiAgIAo+ID4gICAJLyoKPiA+IEBAIC0x
MDcxLDggKzEwNjcsNiBAQCBpbnRlbF9zdm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dAo+ID4gbW1fc3RydWN0ICptbSwgdm9pZCAqZHJ2ZGF0YSkKPiA+ICAgCSAqIEl0IHdpbGwgcmVx
dWlyZSBzaGFyZWQgU1ZNIGRhdGEgc3RydWN0dXJlcywgaS5lLiBjb21iaW5lCj4gPiBpb19tbQo+
ID4gICAJICogYW5kIGludGVsX3N2bSBldGMuCj4gPiAgIAkgKi8KPiA+IC0JaWYgKGRydmRhdGEp
Cj4gPiAtCQlmbGFncyA9ICoodW5zaWduZWQgaW50ICopZHJ2ZGF0YTsKPiA+ICAgCW11dGV4X2xv
Y2soJnBhc2lkX211dGV4KTsKPiA+ICAgCXJldCA9IGludGVsX3N2bV9iaW5kX21tKGRldiwgZmxh
Z3MsIE5VTEwsIG1tLCAmc2Rldik7Cj4gPiAgIAlpZiAocmV0KQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaW9tbXUvaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvaW9tbXUuYwo+ID4gaW5kZXggZDBi
MGExNS4uYmYwYTIwZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaW9tbXUvaW9tbXUuYwo+ID4g
KysrIGIvZHJpdmVycy9pb21tdS9pb21tdS5jCj4gPiBAQCAtMjk2Miw2ICsyOTYyLDcgQEAgRVhQ
T1JUX1NZTUJPTF9HUEwoaW9tbXVfYXV4X2dldF9wYXNpZCk7Cj4gPiAgICAqIGlvbW11X3N2YV9i
aW5kX2RldmljZSgpIC0gQmluZCBhIHByb2Nlc3MgYWRkcmVzcyBzcGFjZSB0byBhIGRldmljZQo+
ID4gICAgKiBAZGV2OiB0aGUgZGV2aWNlCj4gPiAgICAqIEBtbTogdGhlIG1tIHRvIGJpbmQsIGNh
bGxlciBtdXN0IGhvbGQgYSByZWZlcmVuY2UgdG8gaXQKPiA+ICsgKiBAZmxhZ3M6IG9wdGlvbnMg
Zm9yIHRoZSBiaW5kIG9wZXJhdGlvbgo+ID4gICAgKgo+ID4gICAgKiBDcmVhdGUgYSBib25kIGJl
dHdlZW4gZGV2aWNlIGFuZCBhZGRyZXNzIHNwYWNlLCBhbGxvd2luZyB0aGUKPiA+IGRldmljZSB0
byBhY2Nlc3MKPiA+ICAgICogdGhlIG1tIHVzaW5nIHRoZSByZXR1cm5lZCBQQVNJRC4gSWYgYSBi
b25kIGFscmVhZHkgZXhpc3RzIGJldHdlZW4KPiA+IEBkZXZpY2UgYW5kIEBAIC0yOTc0LDcgKzI5
NzUsNyBAQAo+ID4gRVhQT1JUX1NZTUJPTF9HUEwoaW9tbXVfYXV4X2dldF9wYXNpZCk7Cj4gPiAg
ICAqIE9uIGVycm9yLCByZXR1cm5zIGFuIEVSUl9QVFIgdmFsdWUuCj4gPiAgICAqLwo+ID4gICBz
dHJ1Y3QgaW9tbXVfc3ZhICoKPiA+IC1pb21tdV9zdmFfYmluZF9kZXZpY2Uoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdm9pZAo+ID4gKmRydmRhdGEpICtpb21tdV9z
dmFfYmluZF9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbW1fc3RydWN0Cj4gPiAq
bW0sIHVuc2lnbmVkIGludCBmbGFncykgewo+ID4gICAJc3RydWN0IGlvbW11X2dyb3VwICpncm91
cDsKPiA+ICAgCXN0cnVjdCBpb21tdV9zdmEgKmhhbmRsZSA9IEVSUl9QVFIoLUVJTlZBTCk7Cj4g
PiBAQCAtMjk4Nyw2ICsyOTg4LDkgQEAgaW9tbXVfc3ZhX2JpbmRfZGV2aWNlKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0Cj4gPiBtbV9zdHJ1Y3QgKm1tLCB2b2lkICpkcnZkYXRhKSBpZiAoIWdy
b3VwKQo+ID4gICAJCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwo+ID4gICAKPiA+ICsJLyogU3Vw
ZXJ2aXNvciBTVkEgZG9lcyBub3QgbmVlZCB0aGUgY3VycmVudCBtbSAqLwo+ID4gKwlpZiAoKGZs
YWdzICYgSU9NTVVfU1ZBX0JJTkRfU1VQRVJWSVNPUikgJiYgbW0pCj4gPiArCQlyZXR1cm4gRVJS
X1BUUigtRUlOVkFMKTsKPiA+ICAgCS8qIEVuc3VyZSBkZXZpY2UgY291bnQgYW5kIGRvbWFpbiBk
b24ndCBjaGFuZ2Ugd2hpbGUgd2UncmUKPiA+IGJpbmRpbmcgKi8gbXV0ZXhfbG9jaygmZ3JvdXAt
Pm11dGV4KTsKPiA+ICAgCj4gPiBAQCAtMjk5OSw4ICszMDAzLDcgQEAgaW9tbXVfc3ZhX2JpbmRf
ZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0Cj4gPiBtbV9zdHJ1Y3QgKm1tLCB2b2lk
ICpkcnZkYXRhKSBpZiAoaW9tbXVfZ3JvdXBfZGV2aWNlX2NvdW50KGdyb3VwKSAhPSAxKQo+ID4g
ICAJCWdvdG8gb3V0X3VubG9jazsKPiA+ICAgCj4gPiAtCWhhbmRsZSA9IG9wcy0+c3ZhX2JpbmQo
ZGV2LCBtbSwgZHJ2ZGF0YSk7Cj4gPiAtCj4gPiArCWhhbmRsZSA9IG9wcy0+c3ZhX2JpbmQoZGV2
LCBtbSwgZmxhZ3MpOwo+ID4gICBvdXRfdW5sb2NrOgo+ID4gICAJbXV0ZXhfdW5sb2NrKCZncm91
cC0+bXV0ZXgpOwo+ID4gICAJaW9tbXVfZ3JvdXBfcHV0KGdyb3VwKTsKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21pc2MvdWFjY2UvdWFjY2UuYyBiL2RyaXZlcnMvbWlzYy91YWNjZS91YWNjZS5j
Cj4gPiBpbmRleCBkMDdhZjRlLi4yN2UwZTA0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9taXNj
L3VhY2NlL3VhY2NlLmMKPiA+ICsrKyBiL2RyaXZlcnMvbWlzYy91YWNjZS91YWNjZS5jCj4gPiBA
QCAtOTksNyArOTksNyBAQCBzdGF0aWMgaW50IHVhY2NlX2JpbmRfcXVldWUoc3RydWN0IHVhY2Nl
X2RldmljZQo+ID4gKnVhY2NlLCBzdHJ1Y3QgdWFjY2VfcXVldWUgKnEpIGlmICghKHVhY2NlLT5m
bGFncyAmIFVBQ0NFX0RFVl9TVkEpKQo+ID4gICAJCXJldHVybiAwOwo+ID4gICAKPiA+IC0JaGFu
ZGxlID0gaW9tbXVfc3ZhX2JpbmRfZGV2aWNlKHVhY2NlLT5wYXJlbnQsIGN1cnJlbnQtPm1tLAo+
ID4gTlVMTCk7Cj4gPiArCWhhbmRsZSA9IGlvbW11X3N2YV9iaW5kX2RldmljZSh1YWNjZS0+cGFy
ZW50LCBjdXJyZW50LT5tbSwgMCk7Cj4gPiAgIAlpZiAoSVNfRVJSKGhhbmRsZSkpCj4gPiAgIAkJ
cmV0dXJuIFBUUl9FUlIoaGFuZGxlKTsKPiA+ICAgCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9pbnRlbC1pb21tdS5oIGIvaW5jbHVkZS9saW51eC9pbnRlbC1pb21tdS5oCj4gPiBpbmRl
eCAxYmM0NmI4Li5jZGZmNzUyIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9pbnRlbC1p
b21tdS5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2ludGVsLWlvbW11LmgKPiA+IEBAIC03NTcs
NyArNzU3LDcgQEAgaW50IGludGVsX3N2bV9iaW5kX2dwYXNpZChzdHJ1Y3QgaW9tbXVfZG9tYWlu
Cj4gPiAqZG9tYWluLCBzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBpb21tdV9ncGFzaWRfYmlu
ZF9kYXRhICpkYXRhKTsKPiA+ICAgaW50IGludGVsX3N2bV91bmJpbmRfZ3Bhc2lkKHN0cnVjdCBk
ZXZpY2UgKmRldiwgdTMyIHBhc2lkKTsKPiA+ICAgc3RydWN0IGlvbW11X3N2YSAqaW50ZWxfc3Zt
X2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbW1fc3RydWN0Cj4gPiAqbW0sCj4gPiAt
CQkJCSB2b2lkICpkcnZkYXRhKTsKPiA+ICsJCQkJIHVuc2lnbmVkIGludCBmbGFncyk7Cj4gPiAg
IHZvaWQgaW50ZWxfc3ZtX3VuYmluZChzdHJ1Y3QgaW9tbXVfc3ZhICpoYW5kbGUpOwo+ID4gICB1
MzIgaW50ZWxfc3ZtX2dldF9wYXNpZChzdHJ1Y3QgaW9tbXVfc3ZhICpoYW5kbGUpOwo+ID4gICBp
bnQgaW50ZWxfc3ZtX3BhZ2VfcmVzcG9uc2Uoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QKPiA+
IGlvbW11X2ZhdWx0X2V2ZW50ICpldnQsIGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2ludGVs
LXN2bS5oCj4gPiBiL2luY2x1ZGUvbGludXgvaW50ZWwtc3ZtLmggaW5kZXggMzlkMzY4YS4uZWY2
Yjc1MyAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvaW50ZWwtc3ZtLmgKPiA+ICsrKyBi
L2luY2x1ZGUvbGludXgvaW50ZWwtc3ZtLmgKPiA+IEBAIC0zMCwzMCArMzAsMTcgQEAgc3RydWN0
IHN2bV9kZXZfb3BzIHsKPiA+ICAgICogaWYgdGhlcmUgaXMgbm8gb3RoZXIgd2F5IHRvIGRvIHNv
LiBJdCBzaG91bGQgYmUgdXNlZCBzcGFyaW5nbHksIGlmCj4gPiBhdCBhbGwuICovCj4gPiAgICNk
ZWZpbmUgU1ZNX0ZMQUdfUFJJVkFURV9QQVNJRAkJKDE8PDApCj4gPiAtCj4gPiAtLyoKPiA+IC0g
KiBUaGUgU1ZNX0ZMQUdfU1VQRVJWSVNPUl9NT0RFIGZsYWcgcmVxdWVzdHMgYSBQQVNJRCB3aGlj
aCBjYW4gYmUKPiA+IHVzZWQgb25seQo+ID4gLSAqIGZvciBhY2Nlc3MgdG8ga2VybmVsIGFkZHJl
c3Nlcy4gTm8gSU9UTEIgZmx1c2hlcyBhcmUgYXV0b21hdGljYWxseQo+ID4gZG9uZQo+ID4gLSAq
IGZvciBrZXJuZWwgbWFwcGluZ3M7IGl0IGlzIHZhbGlkIG9ubHkgZm9yIGFjY2VzcyB0byB0aGUg
a2VybmVsJ3MKPiA+IHN0YXRpYwo+ID4gLSAqIDE6MSBtYXBwaW5nIG9mIHBoeXNpY2FsIG1lbW9y
eSDigJQgbm90IHRvIHZtYWxsb2Mgb3IgZXZlbiBtb2R1bGUKPiA+IG1hcHBpbmdzLgo+ID4gLSAq
IEEgZnV0dXJlIEFQSSBhZGRpdGlvbiBtYXkgcGVybWl0IHRoZSB1c2Ugb2Ygc3VjaCByYW5nZXMs
IGJ5IG1lYW5zCj4gPiBvZiBhbgo+ID4gLSAqIGV4cGxpY2l0IElPVExCIGZsdXNoIGNhbGwgKGFr
aW4gdG8gdGhlIERNQSBBUEkncyB1bm1hcCBtZXRob2QpLgo+ID4gLSAqCj4gPiAtICogSXQgaXMg
dW5saWtlbHkgdGhhdCB3ZSB3aWxsIGV2ZXIgaG9vayBpbnRvIGZsdXNoX3RsYl9rZXJuZWxfcmFu
Z2UoKQo+ID4gdG8KPiA+IC0gKiBkbyBzdWNoIElPVExCIGZsdXNoZXMgYXV0b21hdGljYWxseS4K
PiA+IC0gKi8KPiA+IC0jZGVmaW5lIFNWTV9GTEFHX1NVUEVSVklTT1JfTU9ERQkoMTw8MSkKPiA+
ICAgLyoKPiA+ICAgICogVGhlIFNWTV9GTEFHX0dVRVNUX01PREUgZmxhZyBpcyB1c2VkIHdoZW4g
YSBQQVNJRCBiaW5kIGlzIGZvciBndWVzdAo+ID4gICAgKiBwcm9jZXNzZXMuIENvbXBhcmVkIHRv
IHRoZSBob3N0IGJpbmQsIHRoZSBwcmltYXJ5IGRpZmZlcmVuY2VzIGFyZToKPiA+ICAgICogMS4g
bW0gbGlmZSBjeWNsZSBtYW5hZ2VtZW50Cj4gPiAgICAqIDIuIGZhdWx0IHJlcG9ydGluZwo+ID4g
ICAgKi8KPiA+IC0jZGVmaW5lIFNWTV9GTEFHX0dVRVNUX01PREUJCSgxPDwyKQo+ID4gKyNkZWZp
bmUgU1ZNX0ZMQUdfR1VFU1RfTU9ERQkJKDE8PDEpCj4gPiAgIC8qCj4gPiAgICAqIFRoZSBTVk1f
RkxBR19HVUVTVF9QQVNJRCBmbGFnIGlzIHVzZWQgd2hlbiBhIGd1ZXN0IGhhcyBpdHMgb3duCj4g
PiBQQVNJRCBzcGFjZSwKPiA+ICAgICogd2hpY2ggcmVxdWlyZXMgZ3Vlc3QgYW5kIGhvc3QgUEFT
SUQgdHJhbnNsYXRpb24gYXQgYm90aCBkaXJlY3Rpb25zLgo+ID4gICAgKi8KPiA+IC0jZGVmaW5l
IFNWTV9GTEFHX0dVRVNUX1BBU0lECQkoMTw8MykKPiA+ICsjZGVmaW5lIFNWTV9GTEFHX0dVRVNU
X1BBU0lECQkoMTw8MikKPiA+ICAgCj4gPiAgICNlbmRpZiAvKiBfX0lOVEVMX1NWTV9IX18gKi8K
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2lvbW11LmggYi9pbmNsdWRlL2xpbnV4L2lv
bW11LmgKPiA+IGluZGV4IDVlN2ZlNTEuLmEzZmJhYTIgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L2lvbW11LmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvaW9tbXUuaAo+ID4gQEAgLTE2
Niw2ICsxNjYsMTkgQEAgZW51bSBpb21tdV9kZXZfZmVhdHVyZXMgewo+ID4gICAKPiA+ICAgI2lm
ZGVmIENPTkZJR19JT01NVV9BUEkKPiA+ICAgCj4gPiArLyoKPiA+ICsgKiBUaGUgSU9NTVVfU1ZB
X0JJTkRfU1VQRVJWSVNPUiBmbGFnIHJlcXVlc3RzIGEgUEFTSUQgd2hpY2ggY2FuIGJlCj4gPiB1
c2VkIG9ubHkKPiA+ICsgKiBmb3IgYWNjZXNzIHRvIGtlcm5lbCBhZGRyZXNzZXMuIE5vIElPVExC
IGZsdXNoZXMgYXJlIGF1dG9tYXRpY2FsbHkKPiA+IGRvbmUKPiA+ICsgKiBmb3Iga2VybmVsIG1h
cHBpbmdzOyBpdCBpcyB2YWxpZCBvbmx5IGZvciBhY2Nlc3MgdG8gdGhlIGtlcm5lbCdzCj4gPiBz
dGF0aWMKPiA+ICsgKiAxOjEgbWFwcGluZyBvZiBwaHlzaWNhbCBtZW1vcnkg4oCUIG5vdCB0byB2
bWFsbG9jIG9yIGV2ZW4gbW9kdWxlCj4gPiBtYXBwaW5ncy4KPiA+ICsgKiBBIGZ1dHVyZSBBUEkg
YWRkaXRpb24gbWF5IHBlcm1pdCB0aGUgdXNlIG9mIHN1Y2ggcmFuZ2VzLCBieSBtZWFucwo+ID4g
b2YgYW4KPiA+ICsgKiBleHBsaWNpdCBJT1RMQiBmbHVzaCBjYWxsIChha2luIHRvIHRoZSBETUEg
QVBJJ3MgdW5tYXAgbWV0aG9kKS4KPiA+ICsgKgo+ID4gKyAqIEl0IGlzIHVubGlrZWx5IHRoYXQg
d2Ugd2lsbCBldmVyIGhvb2sgaW50byBmbHVzaF90bGJfa2VybmVsX3JhbmdlKCkKPiA+IHRvCj4g
PiArICogZG8gc3VjaCBJT1RMQiBmbHVzaGVzIGF1dG9tYXRpY2FsbHkuCj4gPiArICovCj4gPiAr
I2RlZmluZSBJT01NVV9TVkFfQklORF9TVVBFUlZJU09SICAgICAgIEJJVCgwKQo+ID4gKwo+ID4g
ICAvKioKPiA+ICAgICogc3RydWN0IGlvbW11X2lvdGxiX2dhdGhlciAtIFJhbmdlIGluZm9ybWF0
aW9uIGZvciBhIHBlbmRpbmcgSU9UTEIKPiA+IGZsdXNoICoKPiA+IEBAIC0yODcsNyArMzAwLDcg
QEAgc3RydWN0IGlvbW11X29wcyB7Cj4gPiAgIAlpbnQgKCphdXhfZ2V0X3Bhc2lkKShzdHJ1Y3Qg
aW9tbXVfZG9tYWluICpkb21haW4sIHN0cnVjdAo+ID4gZGV2aWNlICpkZXYpOyAKPiA+ICAgCXN0
cnVjdCBpb21tdV9zdmEgKigqc3ZhX2JpbmQpKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0Cj4g
PiBtbV9zdHJ1Y3QgKm1tLAo+ID4gLQkJCQkgICAgICB2b2lkICpkcnZkYXRhKTsKPiA+ICsJCQkJ
ICAgICAgdW5zaWduZWQgaW50IGZsYWdzKTsKPiA+ICAgCXZvaWQgKCpzdmFfdW5iaW5kKShzdHJ1
Y3QgaW9tbXVfc3ZhICpoYW5kbGUpOwo+ID4gICAJdTMyICgqc3ZhX2dldF9wYXNpZCkoc3RydWN0
IGlvbW11X3N2YSAqaGFuZGxlKTsKPiA+ICAgCj4gPiBAQCAtNjQwLDcgKzY1Myw3IEBAIGludCBp
b21tdV9hdXhfZ2V0X3Bhc2lkKHN0cnVjdCBpb21tdV9kb21haW4KPiA+ICpkb21haW4sIHN0cnVj
dCBkZXZpY2UgKmRldik7IAo+ID4gICBzdHJ1Y3QgaW9tbXVfc3ZhICppb21tdV9zdmFfYmluZF9k
ZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2LAo+ID4gICAJCQkJCXN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LAo+ID4gLQkJCQkJdm9pZCAqZHJ2ZGF0YSk7Cj4gPiArCQkJCQl1bnNpZ25lZCBpbnQgZmxhZ3Mp
Owo+ID4gICB2b2lkIGlvbW11X3N2YV91bmJpbmRfZGV2aWNlKHN0cnVjdCBpb21tdV9zdmEgKmhh
bmRsZSk7Cj4gPiAgIHUzMiBpb21tdV9zdmFfZ2V0X3Bhc2lkKHN0cnVjdCBpb21tdV9zdmEgKmhh
bmRsZSk7Cj4gPiAgIAo+ID4gQEAgLTEwMTUsNyArMTAyOCw3IEBAIGlvbW11X2F1eF9nZXRfcGFz
aWQoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLAo+ID4gc3RydWN0IGRldmljZSAqZGV2KSB9
Cj4gPiAgIAo+ID4gICBzdGF0aWMgaW5saW5lIHN0cnVjdCBpb21tdV9zdmEgKgo+ID4gLWlvbW11
X3N2YV9iaW5kX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LCB2b2lkCj4gPiAqZHJ2ZGF0YSkgK2lvbW11X3N2YV9iaW5kX2RldmljZShzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBtbV9zdHJ1Y3QKPiA+ICptbSwgdW5zaWduZWQgaW50IGZsYWdzKSB7Cj4g
PiAgIAlyZXR1cm4gTlVMTDsKPiA+ICAgfQo+ID4gICAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gYmFv
bHUKCgpUaGFua3MsCgpKYWNvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
aW9tbXU=
