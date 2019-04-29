Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF24EA93
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 21:01:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9883D2C0B;
	Mon, 29 Apr 2019 19:01:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A391C2C05
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 19:01:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1C07D876
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 19:01:38 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 978DE68AFE; Mon, 29 Apr 2019 21:01:20 +0200 (CEST)
Date: Mon, 29 Apr 2019 21:01:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 02/26] arm64/iommu: improve mmap bounds checking
Message-ID: <20190429190120.GA5637@lst.de>
References: <20190422175942.18788-1-hch@lst.de>
	<20190422175942.18788-3-hch@lst.de>
	<306b7a19-4eb5-d1d8-5250-40f3ba9bca16@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <306b7a19-4eb5-d1d8-5250-40f3ba9bca16@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
	linux-arm-kernel@lists.infradead.org
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

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDE6MzU6NDZQTSArMDEwMCwgUm9iaW4gTXVycGh5IHdy
b3RlOgo+IE9uIDIyLzA0LzIwMTkgMTg6NTksIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+PiBU
aGUgbnJfcGFnZXMgY2hlY2tzIHNob3VsZCBiZSBkb25lIGZvciBhbGwgbW1hcCByZXF1ZXN0cywg
bm90IGp1c3QgdGhvc2UKPj4gdXNpbmcgcmVtYXBfcGZuX3JhbmdlLgo+Cj4gSSB0aGluayBpdCBw
cm9iYWJseSBtYWtlcyBzZW5zZSBub3cgdG8ganVzdCBzcXVhc2ggdGhpcyB3aXRoICMyMiBvbmUg
d2F5IG9yIAo+IHRoZSBvdGhlciwgYnV0IGlmIHlvdSByZWFsbHkgcmVhbGx5IHN0aWxsIHdhbnQg
dG8ga2VlcCBpdCBhcyBhIHNlcGFyYXRlIAo+IHBhdGNoIHdpdGggYSBtaXNsZWFkaW5nIGNvbW1p
dCBtZXNzYWdlIHRoZW4gSSdtIHdpbGxpbmcgdG8ga2VlcCBteSAKPiBjb21wbGFpbnRzIHRvIG15
c2VsZiA6KQoKV2VsbCwgSSBzcGxpdCB0aGlzIG91dCBpbiByZXNwb25zZSB0byB5b3VyIGVhcmxp
ZXIgY29tbWVudHMsIHNvIGlmIHlvdQpwcmVmZXIgaXQgc3F1YXNoZdGVIGJhY2sgaW4gSSBjYW4g
ZG8gdGhhdC4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
