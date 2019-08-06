Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 857EC83654
	for <lists.iommu@lfdr.de>; Tue,  6 Aug 2019 18:09:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ADC0DD9C;
	Tue,  6 Aug 2019 16:09:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D18D1CB1
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 16:08:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 77BAE82D
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 16:08:59 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 981C320679;
	Tue,  6 Aug 2019 16:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565107739;
	bh=v0k57mTDkfDZaJNeGslFkP/p8/lZF5e0EN6d5zbeXJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QwYLVlSCvE5RkEzMUkxya/17HqX4ysozqlmTdPTPO5zBru0s7lkz8yZHQi0kE7QPa
	J3nsmuubbBmALdIHYivFeIBCfxouhnJ+9TQ0HskYPSpEl7ePJW8QWsSwlXZEvwICkA
	ksIz9c1GMc0XmZhCNFQc096KaCxj+m1SMXGhPUZc=
Date: Tue, 6 Aug 2019 17:08:54 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] dma-mapping: fix page attributes for dma_mmap_*
Message-ID: <20190806160854.htk67msiyadlrl4m@willie-the-truck>
References: <20190801142118.21225-1-hch@lst.de>
	<20190801142118.21225-2-hch@lst.de>
	<20190801162305.3m32chycsdjmdejk@willie-the-truck>
	<20190801163457.GB26588@lst.de>
	<20190801164411.kmsl4japtfkgvzxe@willie-the-truck>
	<20190802081441.GA9725@lst.de>
	<20190802103803.3qrbhqwxlasojsco@willie-the-truck>
	<20190803064812.GA29746@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190803064812.GA29746@lst.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Shawn Anastasio <shawn@anastas.io>, Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

T24gU2F0LCBBdWcgMDMsIDIwMTkgYXQgMDg6NDg6MTJBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMTE6Mzg6MDNBTSArMDEwMCwgV2ls
bCBEZWFjb24gd3JvdGU6Cj4gPiAKPiA+IFNvIHRoaXMgYm9pbHMgZG93biB0byBhIHRlcm1pbm9s
b2d5IG1pc21hdGNoLiBUaGUgQXJtIGFyY2hpdGVjdHVyZSBkb2Vzbid0IGhhdmUKPiA+IGFueXRo
aW5nIGNhbGxlZCAid3JpdGUgY29tYmluZSIsIHNvIGluIExpbnV4IHdlIGluc3RlYWQgcHJvdmlk
ZSB3aGF0IHRoZSBBcm0KPiA+IGFyY2hpdGVjdHVyZSBjYWxscyAiTm9ybWFsIG5vbi1jYWNoZWFi
bGUiIG1lbW9yeSBmb3IgcGdwcm90X3dyaXRlY29tYmluZSgpLgo+ID4gQW1vbmdzdCBvdGhlciB0
aGluZ3MsIHRoaXMgbWVtb3J5IHR5cGUgcGVybWl0cyBzcGVjdWxhdGlvbiwgdW5hbGlnbmVkIGFj
Y2Vzc2VzCj4gPiBhbmQgbWVyZ2luZyBvZiB3cml0ZXMuIEkgZm91bmQgc29tZXRoaW5nIGluIHRo
ZSBhcmNoaXRlY3R1cmUgc3BlYyBhYm91dAo+ID4gbm9uLWNhY2hhYmxlIG1lbW9yeSwgYnV0IGl0
J3Mgd3JpdHRlbiBpbiBBcm1nbGlzaFsxXS4KPiA+IAo+ID4gcGdwcm90X25vbmNhY2hlZCgpLCBv
biB0aGUgb3RoZXIgaGFuZCwgcHJvdmlkZXMgd2hhdCB0aGUgYXJjaGl0ZWN0dXJlIGNhbGxzCj4g
PiBTdHJvbmdseSBPcmRlcmVkIG9yIERldmljZS1uR25SbkUgbWVtb3J5LiBUaGlzIGlzIGludGVu
ZGVkIGZvciBtYXBwaW5nIE1NSU8KPiA+IChpLmUuIFBDSSBjb25maWcgc3BhY2UpIGFuZCB0aGVy
ZWZvcmUgZm9yYmlkcyBzcGVjdWxhdGlvbiwgcHJlc2VydmVzIGFjY2Vzcwo+ID4gc2l6ZSwgcmVx
dWlyZXMgc3RyaWN0IGFsaWdubWVudCBhbmQgYWxzbyBmb3JjZXMgd3JpdGUgcmVzcG9uc2VzIHRv
IGNvbWUgZnJvbQo+ID4gdGhlIGVuZHBvaW50Lgo+ID4gCj4gPiBJIHRoaW5rIHRoZSBuYW1pbmcg
bWlzbWF0Y2ggaXMgaGlzdG9yaWNhbCwgYnV0IG9uIGFybTY0IHdlIHdhbnRlZCB0byB1c2UgdGhl
Cj4gPiBzYW1lIG5hbWVzIGFzIGFybTMyIHNvIHRoYXQgYW55IGRyaXZlcnMgdXNpbmcgdGhlc2Ug
dGhpbmdzIGRpcmVjdGx5IHdvdWxkIGdldAo+ID4gdGhlIHNhbWUgYmVoYXZpb3VyLgo+IAo+IFRo
YXQgYWxsIG1ha2VzIHNlbnNlLCBidXQgaXQgdG90YWxseSBuZWVkcyBhIGNvbW1lbnQuICBJJ2xs
IHRyeSB0byBkcmFmdAo+IG9uZSBiYXNlZCBvbiB0aGlzLiAgSSd2ZSBhbHNvIGxvb2tlZCBhdCB0
aGUgYXJtMzIgY29kZSBhIGJpdCBtb3JlLCBhbmQKPiBpdCBzZWVtcyBhcm0gYWx3YXlzICg/KSBz
dXBwb3J0ZWQgTm9ybWFsIG5vbi1jYWNoZWFibGUgYXR0cmlidXRlLCBidXQKPiBMaW51eCBvbmx5
IG9wdGlvbmFsbHkgdXNlcyBpdCBmb3IgYXJtIHY2KyBiZWNhdXNlIG9mIGZlYXJzIG9mIGRyaXZl
cnMKPiBtaXNzaW5nIGJhcnJpZXJzLgoKSSB0aGluayBpdCB3YXMgYWxzbyB0byBkbyB3aXRoIGFs
aWFzaW5nLCBidXQgSSBkb24ndCByZWNhbGwgYWxsIG9mIHRoZQpkZXRhaWxzLgoKPiBUaGUgb3Ro
ZXIgcmVhbGx5IHdlaXJkIHRoaW5ncyBpcyB0aGF0IGluIGFybTMyCj4gcGdwcm90X2RtYWNvaGVy
ZW50IGluY3VkZXMgdGhlIExfUFRFX1hOIGJpdCwgd2hpY2ggZnJvbSBteSB1bmRlcnN0YW5kaW5n
Cj4gaXMgdGhlIG5vLWV4ZWN0dXJlIGJpdCwgYnV0IHBncHJvdF93cml0ZWNvbWJpbmUgZG9lcyBu
b3QuICBUaGlzIHNlZW1zIHRvCj4gbm90IHZlcnkgdW5pbnRlbnRpb25hbC4gIFNvIG1pbnVzIHRo
YXQgdGhlIHdob2xlIERNQV9BVFRSX1dSSVRFX0NPTULQhk5FCj4gc2VlbXMgdG8gYmUgYWJvdXQg
ZmxhZ2dpbmcgb2xkIGFybSBzcGVjaWZpYyBkcml2ZXJzIGFzIGhhdmluZyB0aGUgcHJvcGVyCj4g
YmFycmllcnMgaW4gcGxhY2VzIGFuZCBvdGhlcndpc2UgaXMgYSBuby1vcC4KCkkgdGhpbmsgaXQg
b25seSBtYXR0ZXJzIGZvciBBcm12NyBDUFVzLCBidXQgeWVzLCB3ZSBzaG91bGQgcHJvYmFibHkg
YmUKc2V0dGluZyBMX1BURV9YTiBmb3IgYm90aCBvZiB0aGVzZSBtZW1vcnkgdHlwZXMuCgo+IEhl
cmUgaXMgbXkgdGVudGF0aXZlIHBsYW46Cj4gCj4gIC0gcmVzcGluIHRoaXMgcGF0Y2ggd2l0aCBh
IHNtYWxsIGZpeCB0byBoYW5kbGUgdGhlCj4gICAgRE1BX0FUVFJfTk9OX0NPTlNJU1RFTlQgKGFz
IGluIGlnbm9yZSBpdCB1bmxlc3MgYWN0dWFsbHkgc3VwcG9ydGVkKSwKPiAgICBidXQga2VlcCB0
aGUgbmFtZSBhcy1pcyB0byBhdm9pZCBjaHVybi4gIFRoaXMgc2hvdWxkIGFsbG93IDUuMwo+ICAg
IGluY2x1c2lvbiBhbmQgYmFja3BvcnRzCj4gIC0gcmVtb3ZlIERNQV9BVFRSX1dSSVRFX0NPTUJJ
TkUgc3VwcG9ydCBmcm9tIG1pcHMsIHByb2JhYmx5IGFsc28gNS4zCj4gICAgbWF0ZXJpYWwuCj4g
IC0gbW92ZSBhbGwgYXJjaGl0ZWN0dXJlcyBidXQgYXJtIG92ZXIgdG8ganVzdCBkZWZpbmUKPiAg
ICBwZ3Byb3RfZG1hY29oZXJlbnQsIGluY2x1ZGluZyBhIGNvbW1lbnQgd2l0aCB0aGUgYWJvdmUg
ZXhwbGFuYXRpb24KPiAgICBmb3IgYXJtNjQuCgpUaGF0IHdvdWxkIGJlIGdyZWF0LCB0aGFua3Mu
Cgo+ICAtIG1ha2UgRE1BX0FUVFJfV1JJVEVfQ09NQklORSBhIG5vLW9wIGFuZCBzY2hlZHVsZSBp
dCBmb3IgcmVtb3ZhbCwKPiAgICB0aHVzIHJlbW92aW5nIHRoZSBsYXN0IGluc3RhbmNlcyBvZiBh
cmNoX2RtYV9tbWFwX3BncHJvdAoKQWxsIHNvdW5kcyBnb29kIHRvIG1lLCBhbHRob3VnaCBJIHN1
cHBvc2UgMzItYml0IEFybSBwbGF0Zm9ybXMgd2l0aG91dApDT05GSUdfQVJNX0RNQV9NRU1fQlVG
RkVSQUJMRSBtYXkgcnVuIGludG8gaXNzdWVzIGlmIERNQV9BVFRSX1dSSVRFX0NPTUJJTkUKZGlz
YXBwZWFycy4gT25seSBvbmUgd2F5IHRvIGZpbmQgb3V0Li4uCgpXaWxsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21t
dUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
