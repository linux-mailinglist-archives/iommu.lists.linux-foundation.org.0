Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0921E13A349
	for <lists.iommu@lfdr.de>; Tue, 14 Jan 2020 09:54:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B3D96876C3;
	Tue, 14 Jan 2020 08:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Qjk-T0eQACy; Tue, 14 Jan 2020 08:54:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B81E387532;
	Tue, 14 Jan 2020 08:54:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADDB2C077D;
	Tue, 14 Jan 2020 08:54:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26EDAC077D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 08:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 11D178364D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 08:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQt9bdfs6Sz9 for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jan 2020 08:54:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 413338362E
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 08:54:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A947568B20; Tue, 14 Jan 2020 09:54:25 +0100 (CET)
Date: Tue, 14 Jan 2020 09:54:25 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jon Derrick <jonathan.derrick@intel.com>
Subject: Re: [PATCH v3 4/5] PCI: vmd: Stop overriding dma_map_ops
Message-ID: <20200114085425.GD32024@lst.de>
References: <1578676873-6206-1-git-send-email-jonathan.derrick@intel.com>
 <1578676873-6206-5-git-send-email-jonathan.derrick@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578676873-6206-5-git-send-email-jonathan.derrick@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>
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

T24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMTA6MjE6MTJBTSAtMDcwMCwgSm9uIERlcnJpY2sgd3Jv
dGU6Cj4gRGV2aWNlcyBvbiB0aGUgVk1EIGRvbWFpbiB1c2UgdGhlIFZNRCBlbmRwb2ludCdzIHJl
cXVlc3RlciBJRCBhbmQgaGF2ZQo+IGJlZW4gcmVseWluZyBvbiB0aGUgVk1EIGVuZHBvaW50J3Mg
RE1BIG9wZXJhdGlvbnMuIFRoZSBwcm9ibGVtIHdpdGggdGhpcwo+IHdhcyB0aGF0IFZNRCBkb21h
aW4gZGV2aWNlcyB3b3VsZCB1c2UgdGhlIFZNRCBlbmRwb2ludCdzIGF0dHJpYnV0ZXMgd2hlbgo+
IGRvaW5nIERNQSBhbmQgSU9NTVUgbWFwcGluZy4gV2UgY2FuIGJlIHNtYXJ0ZXIgYWJvdXQgdGhp
cyBieSBvbmx5IHVzaW5nCj4gdGhlIFZNRCBlbmRwb2ludCB3aGVuIG1hcHBpbmcgYW5kIHByb3Zp
ZGluZyB0aGUgY29ycmVjdCBjaGlsZCBkZXZpY2Uncwo+IGF0dHJpYnV0ZXMgZHVyaW5nIERNQSBv
cGVyYXRpb25zLgo+IAo+IFRoaXMgcGF0Y2ggbW9kaWZpZXMgSW50ZWwtSU9NTVUgdG8gY2hlY2sg
Zm9yIGEgJ0RpcmVjdCBETUEgQWxpYXMnIGFuZAo+IHJlZmVyIHRvIGl0IGZvciBtYXBwaW5nLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEpvbiBEZXJyaWNrIDxqb25hdGhhbi5kZXJyaWNrQGludGVsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5jICAgIHwgIDE4ICsrKy0tCj4g
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvS2NvbmZpZyB8ICAgMSAtCj4gIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvdm1kLmMgICB8IDE1MCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDE1NiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5jIGIvZHJp
dmVycy9pb21tdS9pbnRlbC1pb21tdS5jCj4gaW5kZXggNzE2MzQ3ZTIuLjdjYTgwN2EgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5jCj4gKysrIGIvZHJpdmVycy9pb21t
dS9pbnRlbC1pb21tdS5jCj4gQEAgLTgwNCwxNCArODA0LDE0IEBAIHN0YXRpYyBzdHJ1Y3QgaW50
ZWxfaW9tbXUgKmRldmljZV90b19pb21tdShzdHJ1Y3QgZGV2aWNlICpkZXYsIHU4ICpidXMsIHU4
ICpkZXZmCj4gIAo+ICAJaWYgKGRldl9pc19wY2koZGV2KSkgewo+ICAJCXN0cnVjdCBwY2lfZGV2
ICpwZl9wZGV2Owo+ICsJCXN0cnVjdCBwY2lfZGV2ICpkbWFfYWxpYXM7Cj4gIAo+ICAJCXBkZXYg
PSB0b19wY2lfZGV2KGRldik7Cj4gIAo+IC0jaWZkZWYgQ09ORklHX1g4Ngo+IC0JCS8qIFZNRCBj
aGlsZCBkZXZpY2VzIGN1cnJlbnRseSBjYW5ub3QgYmUgaGFuZGxlZCBpbmRpdmlkdWFsbHkgKi8K
PiAtCQlpZiAoaXNfdm1kKHBkZXYtPmJ1cykpCj4gLQkJCXJldHVybiBOVUxMOwo+IC0jZW5kaWYK
CkRvbid0IHdlIG5lZWQgdGhpcyBzYW5pdHkgY2hlY2sgdG8gcHJldmVudCBhc3NpbmduaW5nIHZt
ZCBzdWJkZXZpY2VzPwoKPiArCQkvKiBETUEgYWxpYXNlZCBkZXZpY2VzIHVzZSB0aGUgRE1BIGFs
aWFzJ3MgSU9NTVUgKi8KPiArCQlkbWFfYWxpYXMgPSBwY2lfZGlyZWN0X2RtYV9hbGlhcyhwZGV2
KTsKPiArCQlpZiAoZG1hX2FsaWFzKQo+ICsJCQlwZGV2ID0gZG1hX2FsaWFzOwo+ICAKPiAgCQkv
KiBWRnMgYXJlbid0IGxpc3RlZCBpbiBzY29wZSB0YWJsZXM7IHdlIG5lZWQgdG8gbG9vayB1cAo+
ICAJCSAqIHRoZSBQRiBpbnN0ZWFkIHRvIGZpbmQgdGhlIElPTU1VLiAqLwo+IEBAIC0yNTIxLDYg
KzI1MjEsMTQgQEAgc3RydWN0IGRtYXJfZG9tYWluICpmaW5kX2RvbWFpbihzdHJ1Y3QgZGV2aWNl
ICpkZXYpCj4gIAkJICAgICBkZXYtPmFyY2hkYXRhLmlvbW11ID09IERVTU1ZX0RFVklDRV9ET01B
SU5fSU5GTykpCj4gIAkJcmV0dXJuIE5VTEw7Cj4gIAo+ICsJaWYgKGRldl9pc19wY2koZGV2KSkg
ewo+ICsJCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwo+ICsJCXN0cnVj
dCBwY2lfZGV2ICpkbWFfYWxpYXMgPSBwY2lfZGlyZWN0X2RtYV9hbGlhcyhwZGV2KTsKPiArCj4g
KwkJaWYgKGRtYV9hbGlhcykKPiArCQkJZGV2ID0gJmRtYV9hbGlhcy0+ZGV2OwoKSW5zdGVhZCBv
ZiBhbGwgdGhlc2UgZHVwbGljYXRlIGNhbGxzLCBzaG91bGRuJ3QgcGNpX2RpcmVjdF9kbWFfYWxp
YXMgYmUKcmVwbGFjZWQgd2l0aCBhIHBjaV9yZWFsX2RtYV9kZXYgaGVscGVyIHRoYXQgZWl0aGVy
IHJldHVybnMgdGhlCmRtYSBwYXJlbnQgaWYgaXQgZXhp0ZV0cywgb3IgdGhlIGFjdHVhbCBkZXZp
Y2U/CgpBbHNvIEkgdGhpbmsgdGhpcyBwYXRjaCBzaG91bGQgYmUgc3BsaXQgLSBvbmUgZm9yIGlu
dGVsLWlvbW11IHRoYXQKanVzdCBhZGRzIHRoZSByZWFsIGRldmljZSBjaGVja3MsIGFuZCB0aGVu
IG9uZSB0aGF0IHdpcmVzIHVwIHZtZCB0bwp0aGUgbmV3IG1lY2hhbmlzbSBhbmQgdGhlbiByZW1v
dmVzIGFsbCB0aGUgY3J1ZnQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9p
b21tdQ==
