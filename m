Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AB858F387
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 11:54:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B2D19F14;
	Tue, 30 Apr 2019 09:54:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EE7A1EFF
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 09:53:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 855E15F4
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 09:53:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1579D80D;
	Tue, 30 Apr 2019 02:53:52 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B97DC3F5C1;
	Tue, 30 Apr 2019 02:53:49 -0700 (PDT)
Subject: Re: [PATCH v3 02/10] swiotlb: Factor out slot allocation and free
To: Lu Baolu <baolu.lu@linux.intel.com>, Christoph Hellwig <hch@lst.de>
References: <20190421011719.14909-1-baolu.lu@linux.intel.com>
	<20190421011719.14909-3-baolu.lu@linux.intel.com>
	<20190422164555.GA31181@lst.de>
	<0c6e5983-312b-0d6b-92f5-64861cd6804d@linux.intel.com>
	<20190423061232.GB12762@lst.de>
	<dff50b2c-5e31-8b4a-7fdf-99d17852746b@linux.intel.com>
	<20190424144532.GA21480@lst.de>
	<a189444b-15c9-8069-901d-8cdf9af7fc3c@linux.intel.com>
	<20190426150433.GA19930@lst.de>
	<93b3d627-782d-cae0-2175-77a5a8b3fe6e@linux.intel.com>
	<90182d27-5764-7676-8ca6-b2773a40cfe1@arm.com>
	<1361b6ab-c3cf-d8ab-5f6b-9d9b7797bf02@linux.intel.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c044c51a-d348-ca37-3eaa-5475e3fec6c9@arm.com>
Date: Tue, 30 Apr 2019 10:53:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1361b6ab-c3cf-d8ab-5f6b-9d9b7797bf02@linux.intel.com>
Content-Language: en-GB
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, mika.westerberg@linux.intel.com, ashok.raj@intel.com,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	alan.cox@intel.com, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, pengfei.xu@intel.com,
	jacob.jun.pan@intel.com, David Woodhouse <dwmw2@infradead.org>
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

T24gMzAvMDQvMjAxOSAwMzowMiwgTHUgQmFvbHUgd3JvdGU6Cj4gSGkgUm9iaW4sCj4gCj4gT24g
NC8yOS8xOSA3OjA2IFBNLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+IE9uIDI5LzA0LzIwMTkgMDY6
MTAsIEx1IEJhb2x1IHdyb3RlOgo+Pj4gSGkgQ2hyaXN0b3BoLAo+Pj4KPj4+IE9uIDQvMjYvMTkg
MTE6MDQgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+Pj4+IE9uIFRodSwgQXByIDI1LCAy
MDE5IGF0IDEwOjA3OjE5QU0gKzA4MDAsIEx1IEJhb2x1IHdyb3RlOgo+Pj4+PiBUaGlzIGlzIG5v
dCBWVC1kIHNwZWNpZmljLiBJdCdzIGp1c3QgaG93IGdlbmVyaWMgSU9NTVUgd29ya3MuCj4+Pj4+
Cj4+Pj4+IE5vcm1hbGx5LCBJT01NVSB3b3JrcyBpbiBwYWdpbmcgbW9kZS4gU28gaWYgYSBkcml2
ZXIgaXNzdWVzIERNQSB3aXRoCj4+Pj4+IElPVkHCoCAweEFBQUEwMTIzLCBJT01NVSBjYW4gcmVt
YXAgaXQgd2l0aCBhIHBoeXNpY2FsIGFkZHJlc3MgCj4+Pj4+IDB4QkJCQjAxMjMuCj4+Pj4+IEJ1
dCB3ZSBzaG91bGQgbmV2ZXIgZXhwZWN0IElPTU1VIHRvIHJlbWFwIDB4QUFBQTAxMjMgd2l0aCBw
aHlzaWNhbAo+Pj4+PiBhZGRyZXNzIG9mIDB4QkJCQjAwMDAuIFRoYXQncyB0aGUgcmVhc29uIHdo
eSBJIHNhaWQgdGhhdCBJT01NVSB3aWxsIAo+Pj4+PiBub3QKPj4+Pj4gd29yayB0aGVyZS4KPj4+
Pgo+Pj4+IFdlbGwsIHdpdGggdGhlIGlvbW11IGl0IGRvZXNuJ3QgaGFwcGVuLsKgIFdpdGggc3dp
b3RsYiBpdCBvYnZpb3N1bHkKPj4+PiBjYW4gaGFwcGVuLCBzbyBkcml2ZXJzIGFyZSBmaW5lIHdp
dGggaXQuwqAgV2h5IHdvdWxkIHRoYXQgc3VkZGVubHkKPj4+PiBiZWNvbWUgYW4gaXNzdWUgd2hl
biBzd2lvdGxiIGlzIGNhbGxlZCBmcm9tIHRoZSBpb21tdSBjb2RlPwo+Pj4+Cj4+Pgo+Pj4gSSB3
b3VsZCBzYXkgSU9NTVUgaXMgRE1BIHJlbWFwcGluZywgbm90IERNQSBlbmdpbmUuIDotKQo+Pgo+
PiBJJ20gbm90IHN1cmUgSSByZWFsbHkgZm9sbG93IHRoZSBpc3N1ZSBoZXJlIC0gaWYgd2UncmUg
Y29weWluZyB0aGUgCj4+IGJ1ZmZlciB0byB0aGUgYm91bmNlIHBhZ2UocykgdGhlcmUncyBubyBj
b25jZXB0dWFsIGRpZmZlcmVuY2UgZnJvbSAKPj4gY29weWluZyBpdCB0byBTV0lPVExCIHNsb3Qo
cyksIHNvIHRoZXJlIHNob3VsZCBiZSBubyBuZWVkIHRvIHdvcnJ5IAo+PiBhYm91dCB0aGUgb3Jp
Z2luYWwgaW4tcGFnZSBvZmZzZXQuCj4+Cj4+IMKgRnJvbSB0aGUgcmVwbHkgdXAtdGhyZWFkIEkg
Z3Vlc3MgeW91J3JlIHRyeWluZyB0byBpbmNsdWRlIGFuIAo+PiBvcHRpbWlzYXRpb24gdG8gb25s
eSBjb3B5IHRoZSBoZWFkIGFuZCB0YWlsIG9mIHRoZSBidWZmZXIgaWYgaXQgc3BhbnMgCj4+IG11
bHRpcGxlIHBhZ2VzLCBhbmQgZGlyZWN0bHkgbWFwIHRoZSBvbmVzIGluIHRoZSBtaWRkbGUsIGJ1
dCBBRkFJQ1MgCj4+IHRoYXQncyBnb2luZyB0byB0aWUgeW91IHRvIGFsc28gdXNpbmcgc3RyaWN0
IG1vZGUgZm9yIFRMQiBtYWludGVuYW5jZSwgCj4+IHdoaWNoIG1heSBub3QgYmUgYSB3aW4gb3Zl
cmFsbCBkZXBlbmRpbmcgb24gdGhlIGJhbGFuY2UgYmV0d2VlbiAKPj4gaW52YWxpZGF0aW9uIGJh
bmR3aWR0aCB2cy4gbWVtY3B5IGJhbmR3aWR0aC4gQXQgbGVhc3QgaWYgd2UgdXNlIAo+PiBzdGFu
ZGFyZCBTV0lPVExCIGxvZ2ljIHRvIGFsd2F5cyBjb3B5IHRoZSB3aG9sZSB0aGluZywgd2Ugc2hv
dWxkIGJlIAo+PiBhYmxlIHRvIHJlbGVhc2UgdGhlIGJvdW5jZSBwYWdlcyB2aWEgdGhlIGZsdXNo
IHF1ZXVlIHRvIGFsbG93ICdzYWZlJyAKPj4gbGF6eSB1bm1hcHMuCj4+Cj4gCj4gV2l0aCByZXNw
ZWN0LCBldmVuIHdlIHVzZSB0aGUgc3RhbmRhcmQgU1dJT1RMQiBsb2dpYywgd2UgbmVlZCB0byB1
c2UKPiB0aGUgc3RyaWN0IG1vZGUgZm9yIFRMQiBtYWludGVuYW5jZS4KPiAKPiBTYXksIHNvbWUg
c3dpb3RibCBzbG90cyBhcmUgdXNlZCBieSB1bnRydXN0ZWQgZGV2aWNlIGZvciBib3VuY2UgcGFn
ZQo+IHB1cnBvc2UuIFdoZW4gdGhlIGRldmljZSBkcml2ZXIgdW5tYXBzIHRoZSBJT1ZBLCB0aGUg
c2xvdHMgYXJlIGZyZWVkIGJ1dAo+IHRoZSBtYXBwaW5nIGlzIHN0aWxsIGNhY2hlZCBpbiBJT1RM
QiwgaGVuY2UgdGhlIHVudHJ1c3RlZCBkZXZpY2UgaXMgCj4gc3RpbGwgYWJsZSB0byBhY2Nlc3Mg
dGhlIHNsb3RzLiBUaGVuIHRoZSBzbG90cyBhcmUgYWxsb2NhdGVkIHRvIG90aGVyCj4gZGV2aWNl
cy4gVGhpcyBtYWtlcyBpdCBwb3NzaWJsZSBmb3IgdGhlIHVudHJ1c3RlZCBkZXZpY2UgdG8gYWNj
ZXNzCj4gdGhlIGRhdGEgYnVmZmVyIG9mIG90aGVyIGRldmljZXMuCgpTdXJlLCB0aGF0J3MgaW5k
ZWVkIGhvdyBpdCB3b3VsZCB3b3JrIHJpZ2h0IG5vdyAtIGhvd2V2ZXIgc2luY2UgdGhlIApib3Vu
Y2UgcGFnZXMgd2lsbCBiZSBmcmVlZCBhbmQgcmV1c2VkIGJ5IHRoZSBETUEgQVBJIGxheWVyIGl0
c2VsZiAoYXQgCnRoZSBzYW1lIGxldmVsIGFzIHRoZSBJT1ZBcykgSSBzZWUgbm8gdGVjaG5pY2Fs
IHJlYXNvbiB3aHkgd2UgY291bGRuJ3QgCmludmVzdGlnYXRlIGRlZmVycmVkIGZyZWVpbmcgYXMg
YSBmdXR1cmUgb3B0aW1pc2F0aW9uLgoKUm9iaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby9pb21tdQ==
