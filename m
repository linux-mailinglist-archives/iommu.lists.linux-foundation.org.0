Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A97A418A37D
	for <lists.iommu@lfdr.de>; Wed, 18 Mar 2020 21:07:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 34ECF2547E;
	Wed, 18 Mar 2020 20:07:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VP+l41xK1xCI; Wed, 18 Mar 2020 20:07:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0D75025EA4;
	Wed, 18 Mar 2020 20:07:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4402C1D8E;
	Wed, 18 Mar 2020 20:07:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 536D6C013E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 20:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4A1EA25389
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 20:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBZq78TgA+Im for <iommu@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 20:07:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id 7DA5E2547E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 20:07:47 +0000 (UTC)
IronPort-SDR: P+l3tJHB72L4fYxG3193Fj4dHUh2z3HYRqNUEuFZb9IWhl9yvYhTUKlmX7XgnYFuZQnUtZaYX5
 SVV4IgXZZk7A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 13:07:47 -0700
IronPort-SDR: dCFBzEmBgG54nIn0WpzJir46FPYGnp4lICxbvllHLiOvOzapA3RHsYCY1YAWu4IvOvJuIo/udO
 KFvH4oxeCQ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="324289601"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga001.jf.intel.com with ESMTP; 18 Mar 2020 13:07:46 -0700
Date: Wed, 18 Mar 2020 13:13:27 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/2] iommu/vt-d: Replace intel SVM APIs with generic SVA
 APIs
Message-ID: <20200318131327.5f5e6600@jacob-builder>
In-Reply-To: <1582586797-61697-4-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1582586797-61697-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1582586797-61697-4-git-send-email-jacob.jun.pan@linux.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>,
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

SnVzdCBhIGdlbnRsZSByZW1pbmRlciwgYW55IGNvbW1lbnRzPwoKVGhhbmtzLAoKSmFjb2IKCk9u
IE1vbiwgMjQgRmViIDIwMjAgMTU6MjY6MzcgLTA4MDAKSmFjb2IgUGFuIDxqYWNvYi5qdW4ucGFu
QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+IFRoaXMgcGF0Y2ggaXMgYW4gaW5pdGlhbCBzdGVw
IHRvIHJlcGxhY2UgSW50ZWwgU1ZNIGNvZGUgd2l0aCB0aGUKPiBmb2xsb3dpbmcgSU9NTVUgU1ZB
IG9wczoKPiBpbnRlbF9zdm1fYmluZF9tbSgpID0+IGlvbW11X3N2YV9iaW5kX2RldmljZSgpCj4g
aW50ZWxfc3ZtX3VuYmluZF9tbSgpID0+IGlvbW11X3N2YV91bmJpbmRfZGV2aWNlKCkKPiBpbnRl
bF9zdm1faXNfcGFzaWRfdmFsaWQoKSA9PiBpb21tdV9zdmFfZ2V0X3Bhc2lkKCkKPiAKPiBUaGUg
ZmVhdHVyZXMgYmVsb3cgd2lsbCBjb250aW51ZSB0byB3b3JrIGJ1dCBhcmUgbm90IGluY2x1ZGVk
IGluIHRoaXMKPiBwYXRjaCBpbiB0aGF0IHRoZXkgYXJlIGhhbmRsZWQgbW9zdGx5IHdpdGhpbiB0
aGUgSU9NTVUgc3Vic3lzdGVtLgo+IC0gSU8gcGFnZSBmYXVsdAo+IC0gbW11IG5vdGlmaWVyCj4g
Cj4gQ29uc29saWRhdGlvbiBvZiB0aGUgYWJvdmUgd2lsbCBjb21lIGFmdGVyIG1lcmdpbmcgZ2Vu
ZXJpYyBJT01NVSBzdmEKPiBjb2RlWzFdLiBUaGVyZSBzaG91bGQgbm90IGJlIGFueSBjaGFuZ2Vz
IG5lZWRlZCBmb3IgU1ZBIHVzZXJzIHN1Y2ggYXMKPiBhY2NlbGVyYXRvciBkZXZpY2UgZHJpdmVy
cyBkdXJpbmcgdGhpcyB0aW1lLgo+IAo+IFsxXSBodHRwOi8vanBicnVja2VyLm5ldC9zdmEvCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSmFjb2IgUGFuIDxqYWNvYi5qdW4ucGFuQGxpbnV4LmludGVsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5jIHwgICAzICsrCj4gIGRyaXZl
cnMvaW9tbXUvaW50ZWwtc3ZtLmMgICB8IDEyMwo+ICsrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gaW5jbHVkZS9saW51eC9pbnRlbC1pb21tdS5oIHwgICA3ICsr
KyBpbmNsdWRlL2xpbnV4L2ludGVsLXN2bS5oICAgfAo+IDg1IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSA0IGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksCj4gMTQwIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2ludGVsLWlvbW11LmMgYi9k
cml2ZXJzL2lvbW11L2ludGVsLWlvbW11LmMKPiBpbmRleCA1ZWNhNmUxMGQyYTQuLmNjZmE1YWRm
ZDA2ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L2ludGVsLWlvbW11LmMKPiArKysgYi9k
cml2ZXJzL2lvbW11L2ludGVsLWlvbW11LmMKPiBAQCAtNjQ3NSw2ICs2NDc1LDkgQEAgY29uc3Qg
c3RydWN0IGlvbW11X29wcyBpbnRlbF9pb21tdV9vcHMgPSB7Cj4gIAkuY2FjaGVfaW52YWxpZGF0
ZQk9IGludGVsX2lvbW11X3N2YV9pbnZhbGlkYXRlLAo+ICAJLnN2YV9iaW5kX2dwYXNpZAk9IGlu
dGVsX3N2bV9iaW5kX2dwYXNpZCwKPiAgCS5zdmFfdW5iaW5kX2dwYXNpZAk9IGludGVsX3N2bV91
bmJpbmRfZ3Bhc2lkLAo+ICsJLnN2YV9iaW5kCQk9IGludGVsX3N2bV9iaW5kLAo+ICsJLnN2YV91
bmJpbmQJCT0gaW50ZWxfc3ZtX3VuYmluZCwKPiArCS5zdmFfZ2V0X3Bhc2lkCQk9IGludGVsX3N2
bV9nZXRfcGFzaWQsCj4gICNlbmRpZgo+ICB9Owo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
b21tdS9pbnRlbC1zdm0uYyBiL2RyaXZlcnMvaW9tbXUvaW50ZWwtc3ZtLmMKPiBpbmRleCAxZDdh
OTUzNzJmOGMuLjM1ZDk0OTUxMzcyOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L2ludGVs
LXN2bS5jCj4gKysrIGIvZHJpdmVycy9pb21tdS9pbnRlbC1zdm0uYwo+IEBAIC01MTYsMTMgKzUx
NiwxNCBAQCBpbnQgaW50ZWxfc3ZtX3VuYmluZF9ncGFzaWQoc3RydWN0IGRldmljZSAqZGV2LAo+
IGludCBwYXNpZCkgcmV0dXJuIHJldDsKPiAgfQo+ICAKPiAtaW50IGludGVsX3N2bV9iaW5kX21t
KHN0cnVjdCBkZXZpY2UgKmRldiwgaW50ICpwYXNpZCwgaW50IGZsYWdzLAo+IHN0cnVjdCBzdm1f
ZGV2X29wcyAqb3BzKSArLyogQ2FsbGVyIG11c3QgaG9sZCBwYXNpZF9tdXRleCwgbW0KPiByZWZl
cmVuY2UgKi8gK3N0YXRpYyBpbnQgaW50ZWxfc3ZtX2JpbmRfbW0oc3RydWN0IGRldmljZSAqZGV2
LCBpbnQKPiBmbGFncywgc3RydWN0IHN2bV9kZXZfb3BzICpvcHMsCj4gKwkJICAgICAgc3RydWN0
IG1tX3N0cnVjdCAqbW0sIHN0cnVjdCBpbnRlbF9zdm1fZGV2Cj4gKipzZCkgewo+ICAJc3RydWN0
IGludGVsX2lvbW11ICppb21tdSA9IGludGVsX3N2bV9kZXZpY2VfdG9faW9tbXUoZGV2KTsKPiAg
CXN0cnVjdCBkZXZpY2VfZG9tYWluX2luZm8gKmluZm87Cj4gIAlzdHJ1Y3QgaW50ZWxfc3ZtX2Rl
diAqc2RldjsKPiAgCXN0cnVjdCBpbnRlbF9zdm0gKnN2bSA9IE5VTEw7Cj4gLQlzdHJ1Y3QgbW1f
c3RydWN0ICptbSA9IE5VTEw7Cj4gIAlpbnQgcGFzaWRfbWF4Owo+ICAJaW50IHJldDsKPiAgCj4g
QEAgLTUzOSwxNiArNTQwLDE1IEBAIGludCBpbnRlbF9zdm1fYmluZF9tbShzdHJ1Y3QgZGV2aWNl
ICpkZXYsIGludAo+ICpwYXNpZCwgaW50IGZsYWdzLCBzdHJ1Y3Qgc3ZtX2Rldl8gfSBlbHNlCj4g
IAkJcGFzaWRfbWF4ID0gMSA8PCAyMDsKPiAgCj4gKwkvKiBCaW5kIHN1cGVydmlzb3IgUEFTSUQg
c2h1bGQgaGF2ZSBtbSA9IE5VTEwgKi8KPiAgCWlmIChmbGFncyAmIFNWTV9GTEFHX1NVUEVSVklT
T1JfTU9ERSkgewo+IC0JCWlmICghZWNhcF9zcnMoaW9tbXUtPmVjYXApKQo+ICsJCWlmICghZWNh
cF9zcnMoaW9tbXUtPmVjYXApIHx8IG1tKSB7Cj4gKwkJCXByX2VycigiU3VwZXJ2aXNvciBQQVNJ
RCB3aXRoIHVzZXIgcHJvdmlkZWQKPiBtbS5cbiIpOyByZXR1cm4gLUVJTlZBTDsKPiAtCX0gZWxz
ZSBpZiAocGFzaWQpIHsKPiAtCQltbSA9IGdldF90YXNrX21tKGN1cnJlbnQpOwo+IC0JCUJVR19P
TighbW0pOwo+ICsJCX0KPiAgCX0KPiAgCj4gLQltdXRleF9sb2NrKCZwYXNpZF9tdXRleCk7Cj4g
LQlpZiAocGFzaWQgJiYgIShmbGFncyAmIFNWTV9GTEFHX1BSSVZBVEVfUEFTSUQpKSB7Cj4gKwlp
ZiAoIShmbGFncyAmIFNWTV9GTEFHX1BSSVZBVEVfUEFTSUQpKSB7Cj4gIAkJc3RydWN0IGludGVs
X3N2bSAqdDsKPiAgCj4gIAkJbGlzdF9mb3JfZWFjaF9lbnRyeSh0LCAmZ2xvYmFsX3N2bV9saXN0
LCBsaXN0KSB7Cj4gQEAgLTU4Niw5ICs1ODYsNyBAQCBpbnQgaW50ZWxfc3ZtX2JpbmRfbW0oc3Ry
dWN0IGRldmljZSAqZGV2LCBpbnQKPiAqcGFzaWQsIGludCBmbGFncywgc3RydWN0IHN2bV9kZXZf
IHNkZXYtPmRldiA9IGRldjsKPiAgCj4gIAlyZXQgPSBpbnRlbF9pb21tdV9lbmFibGVfcGFzaWQo
aW9tbXUsIGRldik7Cj4gLQlpZiAocmV0IHx8ICFwYXNpZCkgewo+IC0JCS8qIElmIHRoZXkgZG9u
J3QgYWN0dWFsbHkgd2FudCB0byBhc3NpZ24gYSBQQVNJRCwKPiB0aGlzIGlzCj4gLQkJICoganVz
dCBhbiBlbmFibGluZyBjaGVjay9wcmVwYXJhdGlvbi4gKi8KPiArCWlmIChyZXQpIHsKPiAgCQlr
ZnJlZShzZGV2KTsKPiAgCQlnb3RvIG91dDsKPiAgCX0KPiBAQCAtNjg4LDE4ICs2ODYsMTcgQEAg
aW50IGludGVsX3N2bV9iaW5kX21tKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50Cj4gKnBhc2lkLCBp
bnQgZmxhZ3MsIHN0cnVjdCBzdm1fZGV2XyB9Cj4gIAl9Cj4gIAlsaXN0X2FkZF9yY3UoJnNkZXYt
Pmxpc3QsICZzdm0tPmRldnMpOwo+IC0KPiAtIHN1Y2Nlc3M6Cj4gLQkqcGFzaWQgPSBzdm0tPnBh
c2lkOwo+ICtzdWNjZXNzOgo+ICsJc2Rldi0+cGFzaWQgPSBzdm0tPnBhc2lkOwo+ICsJc2Rldi0+
c3ZhLmRldiA9IGRldjsKPiArCWlmIChzZCkKPiArCQkqc2QgPSBzZGV2Owo+ICAJcmV0ID0gMDsK
PiAgIG91dDoKPiAtCW11dGV4X3VubG9jaygmcGFzaWRfbXV0ZXgpOwo+IC0JaWYgKG1tKQo+IC0J
CW1tcHV0KG1tKTsKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAtRVhQT1JUX1NZTUJPTF9HUEwoaW50
ZWxfc3ZtX2JpbmRfbW0pOwo+ICAKPiArLyogQ2FsbGVyIG11c3QgaG9sZCBwYXNpZF9tdXRleCAq
Lwo+ICBpbnQgaW50ZWxfc3ZtX3VuYmluZF9tbShzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBwYXNp
ZCkKPiAgewo+ICAJc3RydWN0IGludGVsX3N2bV9kZXYgKnNkZXY7Cj4gQEAgLTcwNyw3ICs3MDQs
NiBAQCBpbnQgaW50ZWxfc3ZtX3VuYmluZF9tbShzdHJ1Y3QgZGV2aWNlICpkZXYsIGludAo+IHBh
c2lkKSBzdHJ1Y3QgaW50ZWxfc3ZtICpzdm07Cj4gIAlpbnQgcmV0ID0gLUVJTlZBTDsKPiAgCj4g
LQltdXRleF9sb2NrKCZwYXNpZF9tdXRleCk7Cj4gIAlpb21tdSA9IGludGVsX3N2bV9kZXZpY2Vf
dG9faW9tbXUoZGV2KTsKPiAgCWlmICghaW9tbXUpCj4gIAkJZ290byBvdXQ7Cj4gQEAgLTc1Myw0
NSArNzQ5LDkgQEAgaW50IGludGVsX3N2bV91bmJpbmRfbW0oc3RydWN0IGRldmljZSAqZGV2LCBp
bnQKPiBwYXNpZCkgYnJlYWs7Cj4gIAl9Cj4gICBvdXQ6Cj4gLQltdXRleF91bmxvY2soJnBhc2lk
X211dGV4KTsKPiAgCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gLUVYUE9SVF9TWU1CT0xfR1BMKGlu
dGVsX3N2bV91bmJpbmRfbW0pOwo+IC0KPiAtaW50IGludGVsX3N2bV9pc19wYXNpZF92YWxpZChz
dHJ1Y3QgZGV2aWNlICpkZXYsIGludCBwYXNpZCkKPiAtewo+IC0Jc3RydWN0IGludGVsX2lvbW11
ICppb21tdTsKPiAtCXN0cnVjdCBpbnRlbF9zdm0gKnN2bTsKPiAtCWludCByZXQgPSAtRUlOVkFM
Owo+IC0KPiAtCW11dGV4X2xvY2soJnBhc2lkX211dGV4KTsKPiAtCWlvbW11ID0gaW50ZWxfc3Zt
X2RldmljZV90b19pb21tdShkZXYpOwo+IC0JaWYgKCFpb21tdSkKPiAtCQlnb3RvIG91dDsKPiAt
Cj4gLQlzdm0gPSBpb2FzaWRfZmluZChOVUxMLCBwYXNpZCwgTlVMTCk7Cj4gLQlpZiAoIXN2bSkK
PiAtCQlnb3RvIG91dDsKPiAtCj4gLQlpZiAoSVNfRVJSKHN2bSkpIHsKPiAtCQlyZXQgPSBQVFJf
RVJSKHN2bSk7Cj4gLQkJZ290byBvdXQ7Cj4gLQl9Cj4gLQkvKiBpbml0X21tIGlzIHVzZWQgaW4g
dGhpcyBjYXNlICovCj4gLQlpZiAoIXN2bS0+bW0pCj4gLQkJcmV0ID0gMTsKPiAtCWVsc2UgaWYg
KGF0b21pY19yZWFkKCZzdm0tPm1tLT5tbV91c2VycykgPiAwKQo+IC0JCXJldCA9IDE7Cj4gLQll
bHNlCj4gLQkJcmV0ID0gMDsKPiAtCj4gLSBvdXQ6Cj4gLQltdXRleF91bmxvY2soJnBhc2lkX211
dGV4KTsKPiAtCj4gLQlyZXR1cm4gcmV0Owo+IC19Cj4gLUVYUE9SVF9TWU1CT0xfR1BMKGludGVs
X3N2bV9pc19wYXNpZF92YWxpZCk7Cj4gIAo+ICAvKiBQYWdlIHJlcXVlc3QgcXVldWUgZGVzY3Jp
cHRvciAqLwo+ICBzdHJ1Y3QgcGFnZV9yZXFfZHNjIHsKPiBAQCAtOTg0LDMgKzk0NCw1NiBAQCBz
dGF0aWMgaXJxcmV0dXJuX3QgcHJxX2V2ZW50X3RocmVhZChpbnQgaXJxLAo+IHZvaWQgKmQpIAo+
ICAJcmV0dXJuIElSUV9SRVRWQUwoaGFuZGxlZCk7Cj4gIH0KPiArCj4gKyNkZWZpbmUgdG9faW50
ZWxfc3ZtX2RldihoYW5kbGUpIGNvbnRhaW5lcl9vZihoYW5kbGUsIHN0cnVjdAo+IGludGVsX3N2
bV9kZXYsIHN2YSkgK3N0cnVjdCBpb21tdV9zdmEgKgo+ICtpbnRlbF9zdm1fYmluZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB2b2lkCj4gKmRydmRhdGEpICt7Cj4g
KwlzdHJ1Y3QgaW9tbXVfc3ZhICpzdmEgPSBFUlJfUFRSKC1FSU5WQUwpOwo+ICsJc3RydWN0IGlu
dGVsX3N2bV9kZXYgKnNkZXYgPSBOVUxMOwo+ICsJaW50IGZsYWdzID0gMDsKPiArCWludCByZXQ7
Cj4gKwo+ICsJLyoKPiArCSAqIFRPRE86IENvbnNvbGlkYXRlIHdpdGggZ2VuZXJpYyBpb21tdS1z
dmEgYmluZCBhZnRlciBpdCBpcwo+IG1lcmdlZC4KPiArCSAqIEl0IHdpbGwgcmVxdWlyZSBzaGFy
ZWQgU1ZNIGRhdGEgc3RydWN0dXJlcywgaS5lLiBjb21iaW5lCj4gaW9fbW0KPiArCSAqIGFuZCBp
bnRlbF9zdm0gZXRjLgo+ICsJICovCj4gKwlpZiAoZHJ2ZGF0YSkKPiArCQlmbGFncyA9ICooaW50
ICopZHJ2ZGF0YTsKPiArCW11dGV4X2xvY2soJnBhc2lkX211dGV4KTsKPiArCXJldCA9IGludGVs
X3N2bV9iaW5kX21tKGRldiwgZmxhZ3MsIE5VTEwsIG1tLCAmc2Rldik7Cj4gKwlpZiAocmV0KQo+
ICsJCXN2YSA9IEVSUl9QVFIocmV0KTsKPiArCWVsc2UgaWYgKHNkZXYpCj4gKwkJc3ZhID0gJnNk
ZXYtPnN2YTsKPiArCWVsc2UKPiArCQlXQVJOKCFzZGV2LCAiU1ZNIGJpbmQgc3VjY2VlZGVkIHdp
dGggbm8gc2RldiFcbiIpOwo+ICsKPiArCW11dGV4X3VubG9jaygmcGFzaWRfbXV0ZXgpOwo+ICsK
PiArCXJldHVybiBzdmE7Cj4gK30KPiArCj4gK3ZvaWQgaW50ZWxfc3ZtX3VuYmluZChzdHJ1Y3Qg
aW9tbXVfc3ZhICpzdmEpCj4gK3sKPiArCXN0cnVjdCBpbnRlbF9zdm1fZGV2ICpzZGV2Owo+ICsK
PiArCW11dGV4X2xvY2soJnBhc2lkX211dGV4KTsKPiArCXNkZXYgPSB0b19pbnRlbF9zdm1fZGV2
KHN2YSk7Cj4gKwlpbnRlbF9zdm1fdW5iaW5kX21tKHNkZXYtPmRldiwgc2Rldi0+cGFzaWQpOwo+
ICsJbXV0ZXhfdW5sb2NrKCZwYXNpZF9tdXRleCk7Cj4gK30KPiArCj4gK2ludCBpbnRlbF9zdm1f
Z2V0X3Bhc2lkKHN0cnVjdCBpb21tdV9zdmEgKnN2YSkKPiArewo+ICsJc3RydWN0IGludGVsX3N2
bV9kZXYgKnNkZXY7Cj4gKwlpbnQgcGFzaWQ7Cj4gKwo+ICsJbXV0ZXhfbG9jaygmcGFzaWRfbXV0
ZXgpOwo+ICsJc2RldiA9IHRvX2ludGVsX3N2bV9kZXYoc3ZhKTsKPiArCXBhc2lkID0gc2Rldi0+
cGFzaWQ7Cj4gKwltdXRleF91bmxvY2soJnBhc2lkX211dGV4KTsKPiArCj4gKwlyZXR1cm4gcGFz
aWQ7Cj4gK30KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pbnRlbC1pb21tdS5oIGIvaW5j
bHVkZS9saW51eC9pbnRlbC1pb21tdS5oCj4gaW5kZXggMzdjZmQzNWI3Y2NmLi4wNDQ0OTNhMTFk
Y2UgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9pbnRlbC1pb21tdS5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9pbnRlbC1pb21tdS5oCj4gQEAgLTcwMiw2ICs3MDIsMTEgQEAgZXh0ZXJuIGlu
dCBpbnRlbF9zdm1fZmluaXNoX3BycShzdHJ1Y3QKPiBpbnRlbF9pb21tdSAqaW9tbXUpOyBleHRl
cm4gaW50IGludGVsX3N2bV9iaW5kX2dwYXNpZChzdHJ1Y3QKPiBpb21tdV9kb21haW4gKmRvbWFp
biwgc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QKPiBpb21tdV9ncGFzaWRfYmluZF9kYXRhICpk
YXRhKTsgZXh0ZXJuIGludAo+IGludGVsX3N2bV91bmJpbmRfZ3Bhc2lkKHN0cnVjdCBkZXZpY2Ug
KmRldiwgaW50IHBhc2lkKTsgK2V4dGVybgo+IHN0cnVjdCBpb21tdV9zdmEgKiAraW50ZWxfc3Zt
X2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QKPiBtbV9zdHJ1Y3QgKm1tLCB2b2lkICpk
cnZkYXRhKTsgK2V4dGVybiB2b2lkIGludGVsX3N2bV91bmJpbmQoc3RydWN0Cj4gaW9tbXVfc3Zh
ICpoYW5kbGUpOyArZXh0ZXJuIGludCBpbnRlbF9zdm1fZ2V0X3Bhc2lkKHN0cnVjdCBpb21tdV9z
dmEKPiAqaGFuZGxlKTsgKwo+ICBzdHJ1Y3Qgc3ZtX2Rldl9vcHM7Cj4gIAo+ICBzdHJ1Y3QgaW50
ZWxfc3ZtX2RldiB7Cj4gQEAgLTcwOSw2ICs3MTQsOCBAQCBzdHJ1Y3QgaW50ZWxfc3ZtX2RldiB7
Cj4gIAlzdHJ1Y3QgcmN1X2hlYWQgcmN1Owo+ICAJc3RydWN0IGRldmljZSAqZGV2Owo+ICAJc3Ry
dWN0IHN2bV9kZXZfb3BzICpvcHM7Cj4gKwlzdHJ1Y3QgaW9tbXVfc3ZhIHN2YTsKPiArCWludCBw
YXNpZDsKPiAgCWludCB1c2VyczsKPiAgCXUxNiBkaWQ7Cj4gIAl1MTYgZGV2X2lvdGxiOjE7Cj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaW50ZWwtc3ZtLmggYi9pbmNsdWRlL2xpbnV4L2lu
dGVsLXN2bS5oCj4gaW5kZXggYTJjMTg5YWQwYjAxLi5mYjdlNzg2ZDg4NzcgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9saW51eC9pbnRlbC1zdm0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvaW50ZWwt
c3ZtLmgKPiBAQCAtNjIsODkgKzYyLDQgQEAgc3RydWN0IHN2bV9kZXZfb3BzIHsKPiAgICovCj4g
ICNkZWZpbmUgU1ZNX0ZMQUdfR1VFU1RfUEFTSUQJKDE8PDMpCj4gIAo+IC0jaWZkZWYgQ09ORklH
X0lOVEVMX0lPTU1VX1NWTQo+IC0KPiAtLyoqCj4gLSAqIGludGVsX3N2bV9iaW5kX21tKCkgLSBC
aW5kIHRoZSBjdXJyZW50IHByb2Nlc3MgdG8gYSBQQVNJRAo+IC0gKiBAZGV2OglEZXZpY2UgdG8g
YmUgZ3JhbnRlZCBhY2Nlc3MKPiAtICogQHBhc2lkOglBZGRyZXNzIGZvciBhbGxvY2F0ZWQgUEFT
SUQKPiAtICogQGZsYWdzOglGbGFncy4gTGF0ZXIgZm9yIHJlcXVlc3Rpbmcgc3VwZXJ2aXNvciBt
b2RlLCBldGMuCj4gLSAqIEBvcHM6CUNhbGxiYWNrcyB0byBkZXZpY2UgZHJpdmVyCj4gLSAqCj4g
LSAqIFRoaXMgZnVuY3Rpb24gYXR0ZW1wdHMgdG8gZW5hYmxlIFBBU0lEIHN1cHBvcnQgZm9yIHRo
ZSBnaXZlbgo+IGRldmljZS4KPiAtICogSWYgdGhlIEBwYXNpZCBhcmd1bWVudCBpcyBub24tJU5V
TEwsIGEgUEFTSUQgaXMgYWxsb2NhdGVkIGZvcgo+IGFjY2Vzcwo+IC0gKiB0byB0aGUgTU0gb2Yg
dGhlIGN1cnJlbnQgcHJvY2Vzcy4KPiAtICoKPiAtICogQnkgdXNpbmcgYSAlTlVMTCB2YWx1ZSBm
b3IgdGhlIEBwYXNpZCBhcmd1bWVudCwgdGhpcyBmdW5jdGlvbiBjYW4KPiAtICogYmUgdXNlZCB0
byBzaW1wbHkgdmFsaWRhdGUgdGhhdCBQQVNJRCBzdXBwb3J0IGlzIGF2YWlsYWJsZSBmb3IgdGhl
Cj4gLSAqIGdpdmVuIGRldmljZSDigJQgaS5lLiB0aGF0IGl0IGlzIGJlaGluZCBhbiBJT01NVSB3
aGljaCBoYXMgdGhlCj4gLSAqIHJlcXVpc2l0ZSBzdXBwb3J0LCBhbmQgaXMgZW5hYmxlZC4KPiAt
ICoKPiAtICogUGFnZSBmYXVsdHMgYXJlIGhhbmRsZWQgdHJhbnNwYXJlbnRseSBieSB0aGUgSU9N
TVUgY29kZSwgYW5kIHRoZXJlCj4gLSAqIHNob3VsZCBiZSBubyBuZWVkIGZvciB0aGUgZGV2aWNl
IGRyaXZlciB0byBiZSBpbnZvbHZlZC4gSWYgYSBwYWdlCj4gLSAqIGZhdWx0IGNhbm5vdCBiZSBo
YW5kbGVkIChpLmUuIGlzIGFuIGludmFsaWQgYWRkcmVzcyByYXRoZXIgdGhhbgo+IC0gKiBqdXN0
IG5lZWRzIHBhZ2luZyBpbiksIHRoZW4gdGhlIHBhZ2UgcmVxdWVzdCB3aWxsIGJlIGNvbXBsZXRl
ZCBieQo+IC0gKiB0aGUgY29yZSBJT01NVSBjb2RlIHdpdGggYXBwcm9wcmlhdGUgc3RhdHVzLCBh
bmQgdGhlIGRldmljZSBpdHNlbGYKPiAtICogY2FuIHRoZW4gcmVwb3J0IHRoZSByZXN1bHRpbmcg
ZmF1bHQgdG8gaXRzIGRyaXZlciB2aWEgd2hhdGV2ZXIKPiAtICogbWVjaGFuaXNtIGlzIGFwcHJv
cHJpYXRlLgo+IC0gKgo+IC0gKiBNdWx0aXBsZSBjYWxscyBmcm9tIHRoZSBzYW1lIHByb2Nlc3Mg
bWF5IHJlc3VsdCBpbiB0aGUgc2FtZSBQQVNJRAo+IC0gKiBiZWluZyByZS11c2VkLiBBIHJlZmVy
ZW5jZSBjb3VudCBpcyBrZXB0Lgo+IC0gKi8KPiAtZXh0ZXJuIGludCBpbnRlbF9zdm1fYmluZF9t
bShzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCAqcGFzaWQsIGludAo+IGZsYWdzLAo+IC0JCQkgICAg
IHN0cnVjdCBzdm1fZGV2X29wcyAqb3BzKTsKPiAtCj4gLS8qKgo+IC0gKiBpbnRlbF9zdm1fdW5i
aW5kX21tKCkgLSBVbmJpbmQgYSBzcGVjaWZpZWQgUEFTSUQKPiAtICogQGRldjoJRGV2aWNlIGZv
ciB3aGljaCBQQVNJRCB3YXMgYWxsb2NhdGVkCj4gLSAqIEBwYXNpZDoJUEFTSUQgdmFsdWUgdG8g
YmUgdW5ib3VuZAo+IC0gKgo+IC0gKiBUaGlzIGZ1bmN0aW9uIGFsbG93cyBhIFBBU0lEIHRvIGJl
IHJldGlyZWQgd2hlbiB0aGUgZGV2aWNlIG5vCj4gLSAqIGxvbmdlciByZXF1aXJlcyBhY2Nlc3Mg
dG8gdGhlIGFkZHJlc3Mgc3BhY2Ugb2YgYSBnaXZlbiBwcm9jZXNzLgo+IC0gKgo+IC0gKiBJZiB0
aGUgdXNlIGNvdW50IGZvciB0aGUgUEFTSUQgaW4gcXVlc3Rpb24gcmVhY2hlcyB6ZXJvLCB0aGUK
PiAtICogUEFTSUQgaXMgcmV2b2tlZCBhbmQgbWF5IG5vIGxvbmdlciBiZSB1c2VkIGJ5IGhhcmR3
YXJlLgo+IC0gKgo+IC0gKiBEZXZpY2UgZHJpdmVycyBhcmUgcmVxdWlyZWQgdG8gZW5zdXJlIHRo
YXQgbm8gYWNjZXNzIChpbmNsdWRpbmcKPiAtICogcGFnZSByZXF1ZXN0cykgaXMgY3VycmVudGx5
IG91dHN0YW5kaW5nIGZvciB0aGUgUEFTSUQgaW4gcXVlc3Rpb24sCj4gLSAqIGJlZm9yZSBjYWxs
aW5nIHRoaXMgZnVuY3Rpb24uCj4gLSAqLwo+IC1leHRlcm4gaW50IGludGVsX3N2bV91bmJpbmRf
bW0oc3RydWN0IGRldmljZSAqZGV2LCBpbnQgcGFzaWQpOwo+IC0KPiAtLyoqCj4gLSAqIGludGVs
X3N2bV9pc19wYXNpZF92YWxpZCgpIC0gY2hlY2sgaWYgcGFzaWQgaXMgdmFsaWQKPiAtICogQGRl
djoJRGV2aWNlIGZvciB3aGljaCBQQVNJRCB3YXMgYWxsb2NhdGVkCj4gLSAqIEBwYXNpZDoJUEFT
SUQgdmFsdWUgdG8gYmUgY2hlY2tlZAo+IC0gKgo+IC0gKiBUaGlzIGZ1bmN0aW9uIGNoZWNrcyBp
ZiB0aGUgc3BlY2lmaWVkIHBhc2lkIGlzIHN0aWxsIHZhbGlkLiBBCj4gLSAqIHZhbGlkIHBhc2lk
IG1lYW5zIHRoZSBiYWNraW5nIG1tIGlzIHN0aWxsIGhhdmluZyBhIHZhbGlkIHVzZXIuCj4gLSAq
IEZvciBrZXJuZWwgY2FsbGVycyBpbml0X21tIGlzIGFsd2F5cyB2YWxpZC4gZm9yIG90aGVyIG1t
LCBpZgo+IG1tLT5tbV91c2Vycwo+IC0gKiBpcyBub24temVybywgaXQgaXMgdmFsaWQuCj4gLSAq
Cj4gLSAqIHJldHVybnMgLUVJTlZBTCBpZiBpbnZhbGlkIHBhc2lkLCAwIGlmIHBhc2lkIHJlZiBj
b3VudCBpcyBpbnZhbGlkCj4gLSAqIDEgaWYgcGFzaWQgaXMgdmFsaWQuCj4gLSAqLwo+IC1leHRl
cm4gaW50IGludGVsX3N2bV9pc19wYXNpZF92YWxpZChzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBw
YXNpZCk7Cj4gLQo+IC0jZWxzZSAvKiBDT05GSUdfSU5URUxfSU9NTVVfU1ZNICovCj4gLQo+IC1z
dGF0aWMgaW5saW5lIGludCBpbnRlbF9zdm1fYmluZF9tbShzdHJ1Y3QgZGV2aWNlICpkZXYsIGlu
dCAqcGFzaWQsCj4gLQkJCQkgICAgaW50IGZsYWdzLCBzdHJ1Y3Qgc3ZtX2Rldl9vcHMKPiAqb3Bz
KSAtewo+IC0JcmV0dXJuIC1FTk9TWVM7Cj4gLX0KPiAtCj4gLXN0YXRpYyBpbmxpbmUgaW50IGlu
dGVsX3N2bV91bmJpbmRfbW0oc3RydWN0IGRldmljZSAqZGV2LCBpbnQgcGFzaWQpCj4gLXsKPiAt
CUJVRygpOwo+IC19Cj4gLQo+IC1zdGF0aWMgaW50IGludGVsX3N2bV9pc19wYXNpZF92YWxpZChz
dHJ1Y3QgZGV2aWNlICpkZXYsIGludCBwYXNpZCkKPiAtewo+IC0JcmV0dXJuIC1FSU5WQUw7Cj4g
LX0KPiAtI2VuZGlmIC8qIENPTkZJR19JTlRFTF9JT01NVV9TVk0gKi8KPiAtCj4gLSNkZWZpbmUg
aW50ZWxfc3ZtX2F2YWlsYWJsZShkZXYpICghaW50ZWxfc3ZtX2JpbmRfbW0oKGRldiksIE5VTEws
IDAsCj4gTlVMTCkpIC0KPiAgI2VuZGlmIC8qIF9fSU5URUxfU1ZNX0hfXyAqLwoKW0phY29iIFBh
bl0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUg
bWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
