Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2462A19FE9F
	for <lists.iommu@lfdr.de>; Mon,  6 Apr 2020 22:01:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BB1368658A;
	Mon,  6 Apr 2020 20:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9N7NPyGzHds; Mon,  6 Apr 2020 20:01:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8571E86559;
	Mon,  6 Apr 2020 20:01:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FE8FC0177;
	Mon,  6 Apr 2020 20:01:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 021A7C0177
 for <iommu@lists.linux-foundation.org>; Mon,  6 Apr 2020 20:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F1D9787EA8
 for <iommu@lists.linux-foundation.org>; Mon,  6 Apr 2020 20:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CITXcuDWzGZL for <iommu@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 20:01:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9D27887E6A
 for <iommu@lists.linux-foundation.org>; Mon,  6 Apr 2020 20:01:45 +0000 (UTC)
IronPort-SDR: IqyvosMa9+lRJ7Fd2jepSicJlhzKXSvEJCnRBaVO2n/TPZxA0HqiUPzedYsfpKlw3tYVrKrueq
 6wOqO/eZF/dA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 13:01:45 -0700
IronPort-SDR: UlQKxXaI/URQkY+VNXAU+nf7tf2SHHp23C5Ay1GQOhYuiS0uOcEJbX1FdL5jQOvqlBB9tEpa5G
 TU5j4OtxVYFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,352,1580803200"; d="scan'208";a="241879070"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by fmsmga007.fm.intel.com with ESMTP; 06 Apr 2020 13:01:44 -0700
Date: Mon, 6 Apr 2020 13:07:34 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 06/10] iommu/ioasid: Convert to set aware allocations
Message-ID: <20200406130734.2d350825@jacob-builder>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7F768D@SHSMSX104.ccr.corp.intel.com>
References: <1585158931-1825-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585158931-1825-7-git-send-email-jacob.jun.pan@linux.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7ED552@SHSMSX104.ccr.corp.intel.com>
 <20200327104134.5cf18a5d@jacob-builder>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7F768D@SHSMSX104.ccr.corp.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Raj, Ashok" <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Cameron <jic23@kernel.org>
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

T24gU2F0LCAyOCBNYXIgMjAyMCAwNjo0MDo1OCArMDAwMAoiVGlhbiwgS2V2aW4iIDxrZXZpbi50
aWFuQGludGVsLmNvbT4gd3JvdGU6Cgo+ID4gRnJvbTogSmFjb2IgUGFuIDxqYWNvYi5qdW4ucGFu
QGxpbnV4LmludGVsLmNvbT4KPiA+IFNlbnQ6IFNhdHVyZGF5LCBNYXJjaCAyOCwgMjAyMCAxOjQy
IEFNCj4gPiAKPiA+IE9uIEZyaSwgMjcgTWFyIDIwMjAgMDk6NTQ6MTEgKzAwMDAKPiA+ICJUaWFu
LCBLZXZpbiIgPGtldmluLnRpYW5AaW50ZWwuY29tPiB3cm90ZToKPiA+ICAgCj4gPiA+ID4gRnJv
bTogSmFjb2IgUGFuIDxqYWNvYi5qdW4ucGFuQGxpbnV4LmludGVsLmNvbT4KPiA+ID4gPiBTZW50
OiBUaHVyc2RheSwgTWFyY2ggMjYsIDIwMjAgMTo1NSBBTQo+ID4gPiA+Cj4gPiA+ID4gVGhlIGN1
cnJlbnQgaW9hc2lkX2FsbG9jIGZ1bmN0aW9uIHRha2VzIGEgdG9rZW4vaW9hc2lkX3NldCB0aGVu
Cj4gPiA+ID4gcmVjb3JkIGl0IG9uIHRoZSBJT0FTSUQgYmVpbmcgYWxsb2NhdGVkLiBUaGVyZSBp
cyBubyBhbGxvYy9mcmVlCj4gPiA+ID4gb24gdGhlIGlvYXNpZF9zZXQuCj4gPiA+ID4KPiA+ID4g
PiBXaXRoIHRoZSBJT0FTSUQgc2V0IEFQSXMsIGNhbGxlcnMgbXVzdCBhbGxvY2F0ZSBhbiBpb2Fz
aWRfc2V0Cj4gPiA+ID4gYmVmb3JlIGFsbG9jYXRlIElPQVNJRHMgd2l0aGluIHRoZSBzZXQuIFF1
b3RhIGFuZCBvdGhlcgo+ID4gPiA+IGlvYXNpZF9zZXQgbGV2ZWwgYWN0aXZpdGllcyBjYW4gdGhl
biBiZSBlbmZvcmNlZC4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgcGF0Y2ggY29udmVydHMgZXhpc3Rp
bmcgQVBJIHRvIHRoZSBuZXcgaW9hc2lkX3NldCBtb2RlbC4KPiA+ID4gPgo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IExpdSBZaSBMIDx5aS5sLmxpdUBpbnRlbC5jb20+Cj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogSmFjb2IgUGFuIDxqYWNvYi5qdW4ucGFuQGxpbnV4LmludGVsLmNvbT4KPiA+ID4gPiAt
LS0KPiA+ID4gPiAgZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5jIHwgMTAgKysrLS0tCj4gPiA+
ID4gIGRyaXZlcnMvaW9tbXUvaW50ZWwtc3ZtLmMgICB8IDEwICsrKy0tLQo+ID4gPiA+ICBkcml2
ZXJzL2lvbW11L2lvYXNpZC5jICAgICAgfCA3OAo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0gLS0tLS0KPiA+ID4gPiAgaW5jbHVkZS9saW51eC9pb2FzaWQu
aCAgICAgIHwgMTEgKysrLS0tLQo+ID4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlv
bnMoKyksIDM3IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaW9tbXUvaW50ZWwtaW9tbXUuYwo+ID4gPiA+IGIvZHJpdmVycy9pb21tdS9pbnRlbC1pb21t
dS5jIGluZGV4IGFmN2ExZWY3YjMxZS4uYzU3MWNjOGQ5ZTU3Cj4gPiA+ID4gMTAwNjQ0IC0tLSBh
L2RyaXZlcnMvaW9tbXUvaW50ZWwtaW9tbXUuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUv
aW50ZWwtaW9tbXUuYwo+ID4gPiA+IEBAIC0zMzIzLDExICszMzIzLDExIEBAIHN0YXRpYyB2b2lk
IGludGVsX2lvYXNpZF9mcmVlKGlvYXNpZF90Cj4gPiA+ID4gaW9hc2lkLCB2b2lkICpkYXRhKQo+
ID4gPiA+ICAJaWYgKCFpb21tdSkKPiA+ID4gPiAgCQlyZXR1cm47Cj4gPiA+ID4gIAkvKgo+ID4g
PiA+IC0JICogU2FuaXR5IGNoZWNrIHRoZSBpb2FzaWQgb3duZXIgaXMgZG9uZSBhdCB1cHBlcgo+
ID4gPiA+IGxheWVyLCBlLmcuIFZGSU8KPiA+ID4gPiAtCSAqIFdlIGNhbiBvbmx5IGZyZWUgdGhl
IFBBU0lEIHdoZW4gYWxsIHRoZSBkZXZpY2VzIGFyZQo+ID4gPiA+IHVuYm91bmQuCj4gPiA+ID4g
KwkgKiBJbiB0aGUgZ3Vlc3QsIGFsbCBJT0FTSURzIGJlbG9uZyB0byB0aGUKPiA+ID4gPiBzeXN0
ZW1faW9hc2lkIHNldC4KPiA+ID4gPiArCSAqIFNhbml0eSBjaGVjayBhZ2FpbnN0IHRoZSBzeXN0
ZW0gc2V0LiAgCj4gPiA+Cj4gPiA+IGJlbG93IGNvZGUgaGFzIG5vdGhpbmcgdG8gZGVhbCB3aXRo
IGd1ZXN0LCB0aGVuIHdoeSBwdXR0aW5nIHRoZQo+ID4gPiBjb21tZW50IHNwZWNpZmljYWxseSBm
b3IgZ3Vlc3Q/Cj4gPiA+ICAKPiA+IGludGVsX2lvYXNpZF9hbGxvYy9mcmVlKCkgaXMgdGhlIGN1
c3RvbSBJT0FTSUQgYWxsb2NhdG9yIG9ubHkKPiA+IHJlZ2lzdGVyZWQgd2hlbiBydW5uaW5nIGlu
IHRoZSBndWVzdC4gIAo+IAo+IGluIHRoYXQgY2FzZSBtYXkgYmUgcmVuYW1lIHRoZSBmdW5jdGlv
bnMgdG8KPiBpbnRlbF9ndWVzdF9pb2FzaWRfYWxsb2MvZnJlZSB3b3VsZCBhdm9pZCBzaW1pbGFy
IGNvbmZ1c2lvbiBhcyBJIGhhZD8KPiAKU291bmRzIGdvb2QuCj4gPiAKPiA+IFRoZSBjdXN0b20g
YWxsb2NhdG9yIGNhbGxzIHZpcnR1YWwgY29tbWFuZC4gU2luY2Ugd2UgZG9uJ3Qgc3VwcG9ydAo+
ID4gbmVzdGVkIGd1ZXN0LCBhbGwgSU9BU0lEcyBiZWxvbmcgdG8gdGhlIHN5c3RlbSBpb2FzaWRf
c2V0LiAgCj4gCj4gY291bGQgeW91IHB1dCBubyBzdXBwb3J0IG9mIG5lc3RlZCBndWVzdCBpbiB0
aGUgY29tbWVudCwgc28gbGF0ZXIKPiB3aGVuIHBlb3BsZSB3YW50IHRvIGFkZCBuZXN0ZWQgc3Vw
cG9ydCB0aGV5IHdpbGwga25vdyBzb21lCj4gYWRkaXRpb25hbCB3b3JrIHJlcXVpcmVkIGhlcmU/
Cj4gCndpbGwgZG8uCgo+ID4gICAKPiA+ID4gPiAgCSAqLwo+ID4gPiA+IC0JaWYgKGlvYXNpZF9m
aW5kKE5VTEwsIGlvYXNpZCwgTlVMTCkpIHsKPiA+ID4gPiAtCQlwcl9hbGVydCgiQ2Fubm90IGZy
ZWUgYWN0aXZlIElPQVNJRCAlZFxuIiwKPiA+ID4gPiBpb2FzaWQpOwo+ID4gPiA+ICsJaWYgKElT
X0VSUihpb2FzaWRfZmluZChzeXN0ZW1faW9hc2lkX3NpZCwgaW9hc2lkLAo+ID4gPiA+IE5VTEwp
KSkgewo+ID4gPiA+ICsJCXByX2VycigiQ2Fubm90IGZyZWUgSU9BU0lEICVkLCBub3QgaW4gc3lz
dGVtCj4gPiA+ID4gc2V0XG4iLCBpb2FzaWQpOyByZXR1cm47Cj4gPiA+ID4gIAl9Cj4gPiA+ID4g
IAl2Y21kX2ZyZWVfcGFzaWQoaW9tbXUsIGlvYXNpZCk7Cj4gPiA+ID4gQEAgLTU1NDEsNyArNTU0
MSw3IEBAIHN0YXRpYyBpbnQgYXV4X2RvbWFpbl9hZGRfZGV2KHN0cnVjdAo+ID4gPiA+IGRtYXJf
ZG9tYWluICpkb21haW4sCj4gPiA+ID4gIAkJaW50IHBhc2lkOwo+ID4gPiA+Cj4gPiA+ID4gIAkJ
LyogTm8gcHJpdmF0ZSBkYXRhIG5lZWRlZCBmb3IgdGhlIGRlZmF1bHQKPiA+ID4gPiBwYXNpZCAq
Lwo+ID4gPiA+IC0JCXBhc2lkID0gaW9hc2lkX2FsbG9jKE5VTEwsIFBBU0lEX01JTiwKPiA+ID4g
PiArCQlwYXNpZCA9IGlvYXNpZF9hbGxvYyhzeXN0ZW1faW9hc2lkX3NpZCwKPiA+ID4gPiBQQVNJ
RF9NSU4sIHBjaV9tYXhfcGFzaWRzKHRvX3BjaV9kZXYoZGV2KSkKPiA+ID4gPiAtIDEsIE5VTEwp
Owo+ID4gPiA+ICAJCWlmIChwYXNpZCA9PSBJTlZBTElEX0lPQVNJRCkgewo+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2lvbW11L2ludGVsLXN2bS5jCj4gPiA+ID4gYi9kcml2ZXJzL2lvbW11
L2ludGVsLXN2bS5jIGluZGV4IDE5OTE1ODdmZDNmZC4uZjUxMTg1NWQxODdiCj4gPiA+ID4gMTAw
NjQ0IC0tLSBhL2RyaXZlcnMvaW9tbXUvaW50ZWwtc3ZtLmMKPiA+ID4gPiArKysgYi9kcml2ZXJz
L2lvbW11L2ludGVsLXN2bS5jCj4gPiA+ID4gQEAgLTI2OCw3ICsyNjgsNyBAQCBpbnQgaW50ZWxf
c3ZtX2JpbmRfZ3Bhc2lkKHN0cnVjdAo+ID4gPiA+IGlvbW11X2RvbWFpbiAqZG9tYWluLAo+ID4g
PiA+ICAJfQo+ID4gPiA+Cj4gPiA+ID4gIAltdXRleF9sb2NrKCZwYXNpZF9tdXRleCk7Cj4gPiA+
ID4gLQlzdm0gPSBpb2FzaWRfZmluZChOVUxMLCBkYXRhLT5ocGFzaWQsIE5VTEwpOwo+ID4gPiA+
ICsJc3ZtID0gaW9hc2lkX2ZpbmQoSU5WQUxJRF9JT0FTSURfU0VULCBkYXRhLT5ocGFzaWQsCj4g
PiA+ID4gTlVMTCk7IGlmIChJU19FUlIoc3ZtKSkgewo+ID4gPiA+ICAJCXJldCA9IFBUUl9FUlIo
c3ZtKTsKPiA+ID4gPiAgCQlnb3RvIG91dDsKPiA+ID4gPiBAQCAtNDAxLDcgKzQwMSw3IEBAIGlu
dCBpbnRlbF9zdm1fdW5iaW5kX2dwYXNpZChzdHJ1Y3QgZGV2aWNlCj4gPiA+ID4gKmRldiwgaW50
IHBhc2lkKQo+ID4gPiA+ICAJCXJldHVybiAtRUlOVkFMOwo+ID4gPiA+Cj4gPiA+ID4gIAltdXRl
eF9sb2NrKCZwYXNpZF9tdXRleCk7Cj4gPiA+ID4gLQlzdm0gPSBpb2FzaWRfZmluZChOVUxMLCBw
YXNpZCwgTlVMTCk7Cj4gPiA+ID4gKwlzdm0gPSBpb2FzaWRfZmluZChJTlZBTElEX0lPQVNJRF9T
RVQsIHBhc2lkLCBOVUxMKTsKPiA+ID4gPiAgCWlmICghc3ZtKSB7Cj4gPiA+ID4gIAkJcmV0ID0g
LUVJTlZBTDsKPiA+ID4gPiAgCQlnb3RvIG91dDsKPiA+ID4gPiBAQCAtNTU5LDcgKzU1OSw3IEBA
IHN0YXRpYyBpbnQgaW50ZWxfc3ZtX2JpbmRfbW0oc3RydWN0IGRldmljZQo+ID4gPiA+ICpkZXYs
IGludCBmbGFncywgc3RydWN0IHN2bV9kZXZfb3BzICoKPiA+ID4gPiAgCQkJcGFzaWRfbWF4ID0g
aW50ZWxfcGFzaWRfbWF4X2lkOwo+ID4gPiA+Cj4gPiA+ID4gIAkJLyogRG8gbm90IHVzZSBQQVNJ
RCAwLCByZXNlcnZlZCBmb3IgUklEIHRvCj4gPiA+ID4gUEFTSUQgKi8KPiA+ID4gPiAtCQlzdm0t
PnBhc2lkID0gaW9hc2lkX2FsbG9jKE5VTEwsIFBBU0lEX01JTiwKPiA+ID4gPiArCQlzdm0tPnBh
c2lkID0gaW9hc2lkX2FsbG9jKHN5c3RlbV9pb2FzaWRfc2lkLAo+ID4gPiA+IFBBU0lEX01JTiwg
cGFzaWRfbWF4IC0gMSwgc3ZtKTsKPiA+ID4gPiAgCQlpZiAoc3ZtLT5wYXNpZCA9PSBJTlZBTElE
X0lPQVNJRCkgewo+ID4gPiA+ICAJCQlrZnJlZShzdm0pOwo+ID4gPiA+IEBAIC02NDIsNyArNjQy
LDcgQEAgaW50IGludGVsX3N2bV91bmJpbmRfbW0oc3RydWN0IGRldmljZSAqZGV2LAo+ID4gPiA+
IGludCBwYXNpZCkKPiA+ID4gPiAgCWlmICghaW9tbXUpCj4gPiA+ID4gIAkJZ290byBvdXQ7Cj4g
PiA+ID4KPiA+ID4gPiAtCXN2bSA9IGlvYXNpZF9maW5kKE5VTEwsIHBhc2lkLCBOVUxMKTsKPiA+
ID4gPiArCXN2bSA9IGlvYXNpZF9maW5kKHN5c3RlbV9pb2FzaWRfc2lkLCBwYXNpZCwgTlVMTCk7
Cj4gPiA+ID4gIAlpZiAoIXN2bSkKPiA+ID4gPiAgCQlnb3RvIG91dDsKPiA+ID4gPgo+ID4gPiA+
IEBAIC03NzgsNyArNzc4LDcgQEAgc3RhdGljIGlycXJldHVybl90IHBycV9ldmVudF90aHJlYWQo
aW50IGlycSwKPiA+ID4gPiB2b2lkICpkKQo+ID4gPiA+Cj4gPiA+ID4gIAkJaWYgKCFzdm0gfHwg
c3ZtLT5wYXNpZCAhPSByZXEtPnBhc2lkKSB7Cj4gPiA+ID4gIAkJCXJjdV9yZWFkX2xvY2soKTsK
PiA+ID4gPiAtCQkJc3ZtID0gaW9hc2lkX2ZpbmQoTlVMTCwgcmVxLT5wYXNpZCwKPiA+ID4gPiBO
VUxMKTsKPiA+ID4gPiArCQkJc3ZtID0gaW9hc2lkX2ZpbmQoSU5WQUxJRF9JT0FTSURfU0VULAo+
ID4gPiA+IHJlcS0+cGFzaWQsIE5VTEwpOyAgCj4gPiA+Cj4gPiA+IGlzIHRoZXJlIGEgY3JpdGVy
aWEgd2hlbiBJTlZBTElEX0lPQVNJRF9TRVQgc2hvdWxkIGJlIHVzZWQ/Cj4gPiA+ICAKPiA+IFR3
byB1c2UgY2FzZXMgZm9yIElOVkFMSURfSU9BU0lEX1NFVDoKPiA+IDEuIGEgaGludCB0byBpb2Fz
aWRfZmluZCB0byBkbyBnbG9iYWwgc2VhcmNoLCBpZ25vcmUgc2V0IG93bmVyc2hpcAo+ID4gY2hl
Y2sgMi4gY2Fubm90IGZpbmQgYSBzZXQgSUQgZm9yIGEgZ2l2ZW4gaW9hc2lkX2ZpbmRfc2lkKCkK
PiA+IAo+ID4gWW91IGJyb3VnaHQgdXAgYSBnb29kIHBvaW50LCBJIG1pc3NlZCB0aGUgc2Vjb25k
IHVzZSBjYXNlLgo+ID4gCj4gPiAgIAo+ID4gPiA+ICAJCQkvKiBJdCAqY2FuJ3QqIGdvIGF3YXks
IGJlY2F1c2UgdGhlCj4gPiA+ID4gZHJpdmVyIGlzIG5vdCBwZXJtaXR0ZWQKPiA+ID4gPiAgCQkJ
ICogdG8gdW5iaW5kIHRoZSBtbSB3aGlsZSBhbnkgcGFnZQo+ID4gPiA+IGZhdWx0cyBhcmUgb3V0
c3RhbmRpbmcuCj4gPiA+ID4gIAkJCSAqIFNvIHdlIG9ubHkgbmVlZCBSQ1UgdG8gcHJvdGVjdCB0
aGUKPiA+ID4gPiBpbnRlcm5hbCBpZHIgY29kZS4gKi8KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pb21tdS9pb2FzaWQuYyBiL2RyaXZlcnMvaW9tbXUvaW9hc2lkLmMKPiA+ID4gPiBpbmRl
eCA5MTM1YWYxNzFhN2MuLmY4OWE1OTVmNjk3OCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L2lvbW11L2lvYXNpZC5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9pb21tdS9pb2FzaWQuYwo+ID4g
PiA+IEBAIC0zMSw3ICszMSw3IEBAIHN0cnVjdCBpb2FzaWRfc2V0X2RhdGEgewo+ID4gPiA+Cj4g
PiA+ID4gIHN0cnVjdCBpb2FzaWRfZGF0YSB7Cj4gPiA+ID4gIAlpb2FzaWRfdCBpZDsKPiA+ID4g
PiAtCXN0cnVjdCBpb2FzaWRfc2V0ICpzZXQ7Cj4gPiA+ID4gKwlzdHJ1Y3QgaW9hc2lkX3NldF9k
YXRhICpzZGF0YTsKPiA+ID4gPiAgCXZvaWQgKnByaXZhdGU7Cj4gPiA+ID4gIAlzdHJ1Y3QgcmN1
X2hlYWQgcmN1Owo+ID4gPiA+ICB9Owo+ID4gPiA+IEBAIC0zMzQsNyArMzM0LDcgQEAgRVhQT1JU
X1NZTUJPTF9HUEwoaW9hc2lkX2F0dGFjaF9kYXRhKTsKPiA+ID4gPgo+ID4gPiA+ICAvKioKPiA+
ID4gPiAgICogaW9hc2lkX2FsbG9jIC0gQWxsb2NhdGUgYW4gSU9BU0lECj4gPiA+ID4gLSAqIEBz
ZXQ6IHRoZSBJT0FTSUQgc2V0Cj4gPiA+ID4gKyAqIEBzaWQ6IHRoZSBJT0FTSUQgc2V0IElECj4g
PiA+ID4gICAqIEBtaW46IHRoZSBtaW5pbXVtIElEIChpbmNsdXNpdmUpCj4gPiA+ID4gICAqIEBt
YXg6IHRoZSBtYXhpbXVtIElEIChpbmNsdXNpdmUpCj4gPiA+ID4gICAqIEBwcml2YXRlOiBkYXRh
IHByaXZhdGUgdG8gdGhlIGNhbGxlcgo+ID4gPiA+IEBAIC0zNDQsMTggKzM0NCwzMCBAQCBFWFBP
UlRfU1lNQk9MX0dQTChpb2FzaWRfYXR0YWNoX2RhdGEpOwo+ID4gPiA+ICAgKgo+ID4gPiA+ICAg
KiBSZXR1cm46IHRoZSBhbGxvY2F0ZWQgSUQgb24gc3VjY2Vzcywgb3IgJUlOVkFMSURfSU9BU0lE
IG9uCj4gPiA+ID4gZmFpbHVyZS4gKi8KPiA+ID4gPiAtaW9hc2lkX3QgaW9hc2lkX2FsbG9jKHN0
cnVjdCBpb2FzaWRfc2V0ICpzZXQsIGlvYXNpZF90IG1pbiwKPiA+ID4gPiBpb2FzaWRfdCBtYXgs
Cj4gPiA+ID4gLQkJICAgICAgdm9pZCAqcHJpdmF0ZSkKPiA+ID4gPiAraW9hc2lkX3QgaW9hc2lk
X2FsbG9jKGludCBzaWQsIGlvYXNpZF90IG1pbiwgaW9hc2lkX3QgbWF4LCB2b2lkCj4gPiA+ID4g
KnByaXZhdGUpIHsKPiA+ID4gPiArCXN0cnVjdCBpb2FzaWRfc2V0X2RhdGEgKnNkYXRhOwo+ID4g
PiA+ICAJc3RydWN0IGlvYXNpZF9kYXRhICpkYXRhOwo+ID4gPiA+ICAJdm9pZCAqYWRhdGE7Cj4g
PiA+ID4gIAlpb2FzaWRfdCBpZDsKPiA+ID4gPgo+ID4gPiA+IC0JZGF0YSA9IGt6YWxsb2Moc2l6
ZW9mKCpkYXRhKSwgR0ZQX0FUT01JQyk7Cj4gPiA+ID4gKwkvKiBDaGVjayBpZiB0aGUgSU9BU0lE
IHNldCBoYXMgYmVlbiBhbGxvY2F0ZWQgYW5kCj4gPiA+ID4gaW5pdGlhbGl6ZWQgKi8KPiA+ID4g
PiArCXNkYXRhID0geGFfbG9hZCgmaW9hc2lkX3NldHMsIHNpZCk7ICAKPiA+ID4KPiA+ID4gb2ss
IHRoaXMgY2hhbmdlIGFuc3dlcnMgbXkgcHJldmlvdXMgcXVlc3Rpb24gaW4gbGFzdCBwYXRjaC4g
8J+Yigo+ID4gPiAgCj4gPiBJIGd1ZXNzIHlvdSBtZWFudCB0aGUgTlVMTCBzZXQgcXVlc3Rpb24/
ICAKPiAKPiB5ZXMKPiAKPiA+ICAgCj4gPiA+ID4gKwlpZiAoIXNkYXRhKSB7Cj4gPiA+ID4gKwkJ
cHJfZXJyKCJJbnZhbGlkIElPQVNJRCBzZXQgJWQgdG8gYWxsb2NhdGUKPiA+ID4gPiBmcm9tXG4i
LCBzaWQpOwo+ID4gPiA+ICsJCXJldHVybiBJTlZBTElEX0lPQVNJRDsKPiA+ID4gPiArCX0KPiA+
ID4gPiArCj4gPiA+ID4gKwlpZiAoc2RhdGEtPnNpemUgPD0gc2RhdGEtPm5yX2lvYXNpZHMpIHsK
PiA+ID4gPiArCQlwcl9lcnIoIklPQVNJRCBzZXQgJWQgb3V0IG9mIHF1b3RhXG4iLCBzaWQpOwo+
ID4gPiA+ICsJCXJldHVybiBJTlZBTElEX0lPQVNJRDsKPiA+ID4gPiArCX0KPiA+ID4gPiArCj4g
PiA+ID4gKwlkYXRhID0ga3phbGxvYyhzaXplb2YoKmRhdGEpLCBHRlBfS0VSTkVMKTsKPiA+ID4g
PiAgCWlmICghZGF0YSkKPiA+ID4gPiAgCQlyZXR1cm4gSU5WQUxJRF9JT0FTSUQ7Cj4gPiA+ID4K
PiA+ID4gPiAtCWRhdGEtPnNldCA9IHNldDsKPiA+ID4gPiArCWRhdGEtPnNkYXRhID0gc2RhdGE7
Cj4gPiA+ID4gIAlkYXRhLT5wcml2YXRlID0gcHJpdmF0ZTsKPiA+ID4gPgo+ID4gPiA+ICAJLyoK
PiA+ID4gPiBAQCAtMzc5LDYgKzM5MSw5IEBAIGlvYXNpZF90IGlvYXNpZF9hbGxvYyhzdHJ1Y3Qg
aW9hc2lkX3NldAo+ID4gPiA+ICpzZXQsIGlvYXNpZF90IG1pbiwgaW9hc2lkX3QgbWF4LAo+ID4g
PiA+ICAJfQo+ID4gPiA+ICAJZGF0YS0+aWQgPSBpZDsKPiA+ID4gPgo+ID4gPiA+ICsJLyogU3Rv
cmUgSU9BU0lEIGluIHRoZSBwZXIgc2V0IGRhdGEgKi8KPiA+ID4gPiArCXhhX3N0b3JlKCZzZGF0
YS0+eGEsIGlkLCBkYXRhLCBHRlBfS0VSTkVMKTsKPiA+ID4gPiArCXNkYXRhLT5ucl9pb2FzaWRz
Kys7Cj4gPiA+ID4gIAlzcGluX3VubG9jaygmaW9hc2lkX2FsbG9jYXRvcl9sb2NrKTsKPiA+ID4g
PiAgCXJldHVybiBpZDsKPiA+ID4gPiAgZXhpdF9mcmVlOgo+ID4gPiA+IEBAIC0zODgsMTkgKzQw
MywxNSBAQCBpb2FzaWRfdCBpb2FzaWRfYWxsb2Moc3RydWN0IGlvYXNpZF9zZXQKPiA+ID4gPiAq
c2V0LCBpb2FzaWRfdCBtaW4sIGlvYXNpZF90IG1heCwKPiA+ID4gPiAgfQo+ID4gPiA+ICBFWFBP
UlRfU1lNQk9MX0dQTChpb2FzaWRfYWxsb2MpOwo+ID4gPiA+Cj4gPiA+ID4gLS8qKgo+ID4gPiA+
IC0gKiBpb2FzaWRfZnJlZSAtIEZyZWUgYW4gSU9BU0lECj4gPiA+ID4gLSAqIEBpb2FzaWQ6IHRo
ZSBJRCB0byByZW1vdmUKPiA+ID4gPiAtICovCj4gPiA+ID4gLXZvaWQgaW9hc2lkX2ZyZWUoaW9h
c2lkX3QgaW9hc2lkKQo+ID4gPiA+ICtzdGF0aWMgdm9pZCBpb2FzaWRfZnJlZV9sb2NrZWQoaW9h
c2lkX3QgaW9hc2lkKQo+ID4gPiA+ICB7Cj4gPiA+ID4gIAlzdHJ1Y3QgaW9hc2lkX2RhdGEgKmlv
YXNpZF9kYXRhOwo+ID4gPiA+ICsJc3RydWN0IGlvYXNpZF9zZXRfZGF0YSAqc2RhdGE7Cj4gPiA+
ID4KPiA+ID4gPiAtCXNwaW5fbG9jaygmaW9hc2lkX2FsbG9jYXRvcl9sb2NrKTsKPiA+ID4gPiAg
CWlvYXNpZF9kYXRhID0geGFfbG9hZCgmYWN0aXZlX2FsbG9jYXRvci0+eGEsIGlvYXNpZCk7Cj4g
PiA+ID4gIAlpZiAoIWlvYXNpZF9kYXRhKSB7Cj4gPiA+ID4gIAkJcHJfZXJyKCJUcnlpbmcgdG8g
ZnJlZSB1bmtub3duIElPQVNJRCAldVxuIiwKPiA+ID4gPiBpb2FzaWQpOwo+ID4gPiA+IC0JCWdv
dG8gZXhpdF91bmxvY2s7Cj4gPiA+ID4gKwkJcmV0dXJuOwo+ID4gPiA+ICAJfQo+ID4gPiA+Cj4g
PiA+ID4gIAlhY3RpdmVfYWxsb2NhdG9yLT5vcHMtPmZyZWUoaW9hc2lkLAo+ID4gPiA+IGFjdGl2
ZV9hbGxvY2F0b3ItPm9wcy0+cGRhdGEpOyBAQCAtNDEwLDcgKzQyMSwyNyBAQCB2b2lkCj4gPiA+
ID4gaW9hc2lkX2ZyZWUoaW9hc2lkX3QgaW9hc2lkKSBrZnJlZV9yY3UoaW9hc2lkX2RhdGEsIHJj
dSk7Cj4gPiA+ID4gIAl9Cj4gPiA+ID4KPiA+ID4gPiAtZXhpdF91bmxvY2s6Cj4gPiA+ID4gKwlz
ZGF0YSA9IHhhX2xvYWQoJmlvYXNpZF9zZXRzLCBpb2FzaWRfZGF0YS0+c2RhdGEtPnNpZCk7Cj4g
PiA+ID4gKwlpZiAoIXNkYXRhKSB7Cj4gPiA+ID4gKwkJcHJfZXJyKCJObyBzZXQgJWQgZm9yIElP
QVNJRCAlZFxuIiwKPiA+ID4gPiBpb2FzaWRfZGF0YS0+c2RhdGEtPnNpZCwKPiA+ID4gPiArCQkg
ICAgICAgaW9hc2lkKTsKPiA+ID4gPiArCQlyZXR1cm47Cj4gPiA+ID4gKwl9Cj4gPiA+ID4gKwl4
YV9lcmFzZSgmc2RhdGEtPnhhLCBpb2FzaWQpOwo+ID4gPiA+ICsJc2RhdGEtPm5yX2lvYXNpZHMt
LTsKPiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4gPiArLyoqCj4gPiA+ID4gKyAqIGlvYXNpZF9m
cmVlIC0gRnJlZSBhbiBJT0FTSUQgYW5kIG5vdGlmeSB1c2VycyB3aG8KPiA+ID4gPiByZWdpc3Rl
cmVkIGEgbm90aWZpZXIKPiA+ID4gPiArICogICAgICAgICAgICAgICBvbiB0aGUgSU9BU0lEIHNl
dC4KPiA+ID4gPiArICogICAgICAgICAgICAgICBJT0FTSUQgY2FuIGJlIHJlLWFsbG9jYXRlZCB1
cG9uIHJldHVybgo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBAaW9hc2lkOiB0aGUgSUQgdG8gcmVt
b3ZlCj4gPiA+ID4gKyAqLwo+ID4gPiA+ICt2b2lkIGlvYXNpZF9mcmVlKGlvYXNpZF90IGlvYXNp
ZCkKPiA+ID4gPiArewo+ID4gPiA+ICsJc3Bpbl9sb2NrKCZpb2FzaWRfYWxsb2NhdG9yX2xvY2sp
Owo+ID4gPiA+ICsJaW9hc2lkX2ZyZWVfbG9ja2VkKGlvYXNpZCk7Cj4gPiA+ID4gIAlzcGluX3Vu
bG9jaygmaW9hc2lkX2FsbG9jYXRvcl9sb2NrKTsKPiA+ID4gPiAgfQo+ID4gPiA+ICBFWFBPUlRf
U1lNQk9MX0dQTChpb2FzaWRfZnJlZSk7Cj4gPiA+ID4gQEAgLTQ5OSw4ICs1MzAsMTIgQEAgdm9p
ZCBpb2FzaWRfZnJlZV9zZXQoaW50IHNpZCwgYm9vbAo+ID4gPiA+IGRlc3Ryb3lfc2V0KSBnb3Rv
IGRvbmVfZGVzdHJveTsKPiA+ID4gPiAgCX0KPiA+ID4gPgo+ID4gPiA+IC0JLyogSnVzdCBhIHBs
YWNlIGhvbGRlciBmb3Igbm93ICovCj4gPiA+ID4gIAl4YV9mb3JfZWFjaCgmc2RhdGEtPnhhLCBp
bmRleCwgZW50cnkpIHsKPiA+ID4gPiArCQkvKgo+ID4gPiA+ICsJCSAqIEZyZWUgZnJvbSBzeXN0
ZW0td2lkZSBJT0FTSUQgcG9vbCwgYWxsCj4gPiA+ID4gc3Vic2NyaWJlcnMgZ2V0cwo+ID4gPiA+
ICsJCSAqIG5vdGlmaWVkIGFuZCBkbyBjbGVhbnVwLgo+ID4gPiA+ICsJCSAqLyAgCj4gPiA+Cj4g
PiA+IHRoaXMgY29tbWVudCBtaWdodCBiZSBhZGRlZCB0b28gZWFybHkuLi4gIAo+ID4gWWVzLCBJ
IHNob3VsZCBtb3ZlIGl0IHRvIG5vdGlmaWVyIHBhdGNoLgo+ID4gICAKPiA+ID4gIAo+ID4gPiA+
ICsJCWlvYXNpZF9mcmVlX2xvY2tlZChpbmRleCk7Cj4gPiA+ID4gIAkJLyogRnJlZSBmcm9tIHBl
ciBzdWItc2V0IHBvb2wgKi8KPiA+ID4gPiAgCQl4YV9lcmFzZSgmc2RhdGEtPnhhLCBpbmRleCk7
Cj4gPiA+ID4gIAl9Cj4gPiA+ID4gQEAgLTUwOCw3ICs1NDMsNiBAQCB2b2lkIGlvYXNpZF9mcmVl
X3NldChpbnQgc2lkLCBib29sCj4gPiA+ID4gZGVzdHJveV9zZXQpIGRvbmVfZGVzdHJveToKPiA+
ID4gPiAgCWlmIChkZXN0cm95X3NldCkgewo+ID4gPiA+ICAJCXhhX2VyYXNlKCZpb2FzaWRfc2V0
cywgc2lkKTsKPiA+ID4gPiAtCj4gPiA+ID4gIAkJLyogUmV0dXJuIHRoZSBxdW90YSBiYWNrIHRv
IHN5c3RlbSBwb29sICovCj4gPiA+ID4gIAkJaW9hc2lkX2NhcGFjaXR5X2F2YWlsICs9IHNkYXRh
LT5zaXplOwo+ID4gPiA+ICAJCWtmcmVlX3JjdShzZGF0YSwgcmN1KTsKPiA+ID4gPiBAQCAtNTIy
LDcgKzU1Niw3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGlvYXNpZF9mcmVlX3NldCk7Cj4gPiA+ID4K
PiA+ID4gPiAgLyoqCj4gPiA+ID4gICAqIGlvYXNpZF9maW5kIC0gRmluZCBJT0FTSUQgZGF0YQo+
ID4gPiA+IC0gKiBAc2V0OiB0aGUgSU9BU0lEIHNldAo+ID4gPiA+ICsgKiBAc2lkOiB0aGUgSU9B
U0lEIHNldCBJRAo+ID4gPiA+ICAgKiBAaW9hc2lkOiB0aGUgSU9BU0lEIHRvIGZpbmQKPiA+ID4g
PiAgICogQGdldHRlcjogZnVuY3Rpb24gdG8gY2FsbCBvbiB0aGUgZm91bmQgb2JqZWN0Cj4gPiA+
ID4gICAqCj4gPiA+ID4gQEAgLTUzMiwxMCArNTY2LDEyIEBAIEVYUE9SVF9TWU1CT0xfR1BMKGlv
YXNpZF9mcmVlX3NldCk7Cj4gPiA+ID4gICAqCj4gPiA+ID4gICAqIElmIHRoZSBJT0FTSUQgZXhp
c3RzLCByZXR1cm4gdGhlIHByaXZhdGUgcG9pbnRlciBwYXNzZWQgdG8KPiA+ID4gPiBpb2FzaWRf
YWxsb2MuCj4gPiA+ID4gICAqIFByaXZhdGUgZGF0YSBjYW4gYmUgTlVMTCBpZiBub3Qgc2V0LiBS
ZXR1cm4gYW4gZXJyb3IgaWYgdGhlCj4gPiA+ID4gSU9BU0lEIGlzIG5vdAo+ID4gPiA+IC0gKiBm
b3VuZCwgb3IgaWYgQHNldCBpcyBub3QgTlVMTCBhbmQgdGhlIElPQVNJRCBkb2VzIG5vdAo+ID4g
PiA+IGJlbG9uZyB0byB0aGUgc2V0Lgo+ID4gPiA+ICsgKiBmb3VuZC4KPiA+ID4gPiArICoKPiA+
ID4gPiArICogSWYgc2lkIGlzIElOVkFMSURfSU9BU0lEX1NFVCwgaXQgd2lsbCBza2lwIHNldCBv
d25lcnNoaXAKPiA+ID4gPiBjaGVja2luZy4gT3RoZXJ3aXNlLAo+ID4gPiA+ICsgKiBlcnJvciBp
cyByZXR1cm5lZCBldmVuIGlmIHRoZSBJT0FTSUQgaXMgZm91bmQgYnV0IGRvZXMgbm90Cj4gPiA+
ID4gYmVsb25nIHRoZSBzZXQuICovCj4gPiA+ID4gLXZvaWQgKmlvYXNpZF9maW5kKHN0cnVjdCBp
b2FzaWRfc2V0ICpzZXQsIGlvYXNpZF90IGlvYXNpZCwKPiA+ID4gPiAtCQkgIGJvb2wgKCpnZXR0
ZXIpKHZvaWQgKikpCj4gPiA+ID4gK3ZvaWQgKmlvYXNpZF9maW5kKGludCBzaWQsIGlvYXNpZF90
IGlvYXNpZCwgYm9vbAo+ID4gPiA+ICgqZ2V0dGVyKSh2b2lkICopKSB7Cj4gPiA+ID4gIAl2b2lk
ICpwcml2Owo+ID4gPiA+ICAJc3RydWN0IGlvYXNpZF9kYXRhICppb2FzaWRfZGF0YTsKPiA+ID4g
PiBAQCAtNTQ4LDcgKzU4NCw3IEBAIHZvaWQgKmlvYXNpZF9maW5kKHN0cnVjdCBpb2FzaWRfc2V0
ICpzZXQsCj4gPiA+ID4gaW9hc2lkX3QgaW9hc2lkLAo+ID4gPiA+ICAJCXByaXYgPSBFUlJfUFRS
KC1FTk9FTlQpOwo+ID4gPiA+ICAJCWdvdG8gdW5sb2NrOwo+ID4gPiA+ICAJfQo+ID4gPiA+IC0J
aWYgKHNldCAmJiBpb2FzaWRfZGF0YS0+c2V0ICE9IHNldCkgewo+ID4gPiA+ICsJaWYgKHNpZCAh
PSBJTlZBTElEX0lPQVNJRF9TRVQgJiYKPiA+ID4gPiBpb2FzaWRfZGF0YS0+c2RhdGEtPnNpZCAh
PSBzaWQpIHsgLyogZGF0YSBmb3VuZCBidXQgZG9lcyBub3QKPiA+ID4gPiBiZWxvbmcgdG8gdGhl
IHNldCAqLyBwcml2ID0gRVJSX1BUUigtRUFDQ0VTKTsKPiA+ID4gPiAgCQlnb3RvIHVubG9jazsK
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pb2FzaWQuaCBiL2luY2x1ZGUvbGlu
dXgvaW9hc2lkLmgKPiA+ID4gPiBpbmRleCAwOTdiMWNjMDQzYTMuLmUxOWMwYWQ5M2JkNyAxMDA2
NDQKPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2lvYXNpZC5oCj4gPiA+ID4gKysrIGIvaW5j
bHVkZS9saW51eC9pb2FzaWQuaAo+ID4gPiA+IEBAIC02LDYgKzYsNyBAQAo+ID4gPiA+ICAjaW5j
bHVkZSA8bGludXgvZXJybm8uaD4KPiA+ID4gPgo+ID4gPiA+ICAjZGVmaW5lIElOVkFMSURfSU9B
U0lEICgoaW9hc2lkX3QpLTEpCj4gPiA+ID4gKyNkZWZpbmUgSU5WQUxJRF9JT0FTSURfU0VUICgt
MSkKPiA+ID4gPiAgdHlwZWRlZiB1bnNpZ25lZCBpbnQgaW9hc2lkX3Q7Cj4gPiA+ID4gIHR5cGVk
ZWYgaW9hc2lkX3QgKCppb2FzaWRfYWxsb2NfZm5fdCkoaW9hc2lkX3QgbWluLCBpb2FzaWRfdAo+
ID4gPiA+IG1heCwgdm9pZCAqZGF0YSk7IHR5cGVkZWYgdm9pZCAoKmlvYXNpZF9mcmVlX2ZuX3Qp
KGlvYXNpZF90Cj4gPiA+ID4gaW9hc2lkLCB2b2lkICpkYXRhKTsgQEAgLTM1LDExICszNiwxMCBA
QCBleHRlcm4gaW50Cj4gPiA+ID4gc3lzdGVtX2lvYXNpZF9zaWQ7ICNkZWZpbmUgREVDTEFSRV9J
T0FTSURfU0VUKG5hbWUpIHN0cnVjdAo+ID4gPiA+IGlvYXNpZF9zZXQgbmFtZSA9IHsgMCB9Cj4g
PiA+ID4KPiA+ID4gPiAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0lPQVNJRCkKPiA+ID4gPiAtaW9h
c2lkX3QgaW9hc2lkX2FsbG9jKHN0cnVjdCBpb2FzaWRfc2V0ICpzZXQsIGlvYXNpZF90IG1pbiwK
PiA+ID4gPiBpb2FzaWRfdCBtYXgsICtpb2FzaWRfdCBpb2FzaWRfYWxsb2MoaW50IHNpZCwgaW9h
c2lkX3QgbWluLAo+ID4gPiA+IGlvYXNpZF90IG1heCwgdm9pZCAqcHJpdmF0ZSk7Cj4gPiA+ID4g
IHZvaWQgaW9hc2lkX2ZyZWUoaW9hc2lkX3QgaW9hc2lkKTsKPiA+ID4gPiAtdm9pZCAqaW9hc2lk
X2ZpbmQoc3RydWN0IGlvYXNpZF9zZXQgKnNldCwgaW9hc2lkX3QgaW9hc2lkLAo+ID4gPiA+IC0J
CSAgYm9vbCAoKmdldHRlcikodm9pZCAqKSk7Cj4gPiA+ID4gK3ZvaWQgKmlvYXNpZF9maW5kKGlu
dCBzaWQsIGlvYXNpZF90IGlvYXNpZCwgYm9vbCAoKmdldHRlcikodm9pZAo+ID4gPiA+ICopKTsg
aW50IGlvYXNpZF9yZWdpc3Rlcl9hbGxvY2F0b3Ioc3RydWN0IGlvYXNpZF9hbGxvY2F0b3Jfb3Bz
Cj4gPiA+ID4gKmFsbG9jYXRvcik7IHZvaWQgaW9hc2lkX3VucmVnaXN0ZXJfYWxsb2NhdG9yKHN0
cnVjdAo+ID4gPiA+IGlvYXNpZF9hbGxvY2F0b3Jfb3BzICphbGxvY2F0b3IpOyBpbnQKPiA+ID4g
PiBpb2FzaWRfYXR0YWNoX2RhdGEoaW9hc2lkX3QgaW9hc2lkLCB2b2lkICpkYXRhKTsgQEAgLTQ5
LDcgKzQ5LDcKPiA+ID4gPiBAQCBpbnQgaW9hc2lkX2FsbG9jX3NldChzdHJ1Y3QgaW9hc2lkX3Nl
dCAqdG9rZW4sIGlvYXNpZF90Cj4gPiA+ID4gcXVvdGEsIGludCAqc2lkKTsgdm9pZCBpb2FzaWRf
ZnJlZV9zZXQoaW50IHNpZCwgYm9vbAo+ID4gPiA+IGRlc3Ryb3lfc2V0KTsgaW50IGlvYXNpZF9m
aW5kX3NpZChpb2FzaWRfdCBpb2FzaWQpOwo+ID4gPiA+ICAjZWxzZSAvKiAhQ09ORklHX0lPQVNJ
RCAqLwo+ID4gPiA+IC1zdGF0aWMgaW5saW5lIGlvYXNpZF90IGlvYXNpZF9hbGxvYyhzdHJ1Y3Qg
aW9hc2lkX3NldCAqc2V0LAo+ID4gPiA+IGlvYXNpZF90IG1pbiwgK3N0YXRpYyBpbmxpbmUgaW9h
c2lkX3QgaW9hc2lkX2FsbG9jKGludCBzaWQsCj4gPiA+ID4gaW9hc2lkX3QgbWluLCBpb2FzaWRf
dCBtYXgsIHZvaWQgKnByaXZhdGUpCj4gPiA+ID4gIHsKPiA+ID4gPiAgCXJldHVybiBJTlZBTElE
X0lPQVNJRDsKPiA+ID4gPiBAQCAtNjgsOCArNjgsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaW9h
c2lkX2ZyZWVfc2V0KGludCBzaWQsCj4gPiA+ID4gYm9vbCBkZXN0cm95X3NldCkKPiA+ID4gPiAg
ewo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiAtc3RhdGljIGlubGluZSB2b2lkICppb2FzaWRf
ZmluZChzdHJ1Y3QgaW9hc2lkX3NldCAqc2V0LAo+ID4gPiA+IGlvYXNpZF90IGlvYXNpZCwKPiA+
ID4gPiAtCQkJCWJvb2wgKCpnZXR0ZXIpKHZvaWQgKikpCj4gPiA+ID4gK3N0YXRpYyBpbmxpbmUg
dm9pZCAqaW9hc2lkX2ZpbmQoaW50IHNpZCwgaW9hc2lkX3QgaW9hc2lkLCBib29sCj4gPiA+ID4g
KCpnZXR0ZXIpKHZvaWQgKikpIHsKPiA+ID4gPiAgCXJldHVybiBOVUxMOwo+ID4gPiA+ICB9Cj4g
PiA+ID4gLS0KPiA+ID4gPiAyLjcuNCAgCj4gPiA+ICAKPiA+IAo+ID4gW0phY29iIFBhbl0gIAoK
W0phY29iIFBhbl0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
