Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F02AE6D6C
	for <lists.iommu@lfdr.de>; Mon, 28 Oct 2019 08:42:06 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 17244B4B;
	Mon, 28 Oct 2019 07:42:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5248AB0B
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 07:42:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C5C9142D
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 07:41:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5AF8668C65; Mon, 28 Oct 2019 08:41:56 +0100 (CET)
Date: Mon, 28 Oct 2019 08:41:56 +0100
From: Christoph Hellwig <hch@lst.de>
To: isaacm@codeaurora.org
Subject: Re: [PATCH] iommu/dma: Add support for DMA_ATTR_SYS_CACHE
Message-ID: <20191028074156.GB20443@lst.de>
References: <1572050616-6143-1-git-send-email-isaacm@codeaurora.org>
	<20191026053026.GA14545@lst.de>
	<e5fe861d7d506eb41c23f3fc047efdfa@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5fe861d7d506eb41c23f3fc047efdfa@codeaurora.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: will@kernel.org, linux-kernel@vger.kernel.org, pratikp@codeaurora.org,
	iommu@lists.linux-foundation.org, lmark@codeaurora.org,
	robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>
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

T24gU2F0LCBPY3QgMjYsIDIwMTkgYXQgMDM6MTI6NTdBTSAtMDcwMCwgaXNhYWNtQGNvZGVhdXJv
cmEub3JnIHdyb3RlOgo+IE9uIDIwMTktMTAtMjUgMjI6MzAsIENocmlzdG9waCBIZWxsd2lnIHdy
b3RlOgo+PiBUaGUgZGVmaW5pdGlvbiBtYWtlcyB2ZXJ5IGxpdHRsZSBzZW5zZS4KPiBDYW4geW91
IHBsZWFzZSBjbGFyaWZ5IHdoYXQgcGFydCBkb2VzbuKAmXQgbWFrZSBzZW5zZSwgYW5kIHdoeT8K
Ckl0IGxvb2tzIGxpa2UgY29tcGxldGUgZ2FyYmFnZSB0byBtZS4gIFRoYXQgbWlnaHQganVzdCBi
ZSBiZWNhdXNlIGl0CnVzZXMgdG9ucyBvZiB0ZXJtcyBJJ3ZlIG5ldmVyIGhlYXJkIG9mIG9mIGFu
ZCB3aGljaCBhcmVuJ3QgdXNlZCBhbnl3aGVyZQppbiB0aGUgRE1BIEFQSS4gIEl0IGFsc28gbWln
aHQgYmUgYmVjYXVzZSBpdCBkb2Vzbid0IGV4cGxhaW4gaG93IHRoZQpmbGFnIG1pZ2h0IGFjdHVh
bGx5IGJlIHByYWN0aWNhbGx5IHVzZWZ1bC4KCj4gVGhpcyBpcyAKPiByZWFsbHkganVzdCBhbiBl
eHRlbnNpb24gb2YgdGhpcyBwYXRjaCB0aGF0IGdvdCBtYWlubGluZWQsIHNvIHRoYXQgY2xpZW50
cyAKPiB0aGF0IHVzZSB0aGUgRE1BIEFQSSBjYW4gdXNlIElPTU1VX1FDT01fU1lTX0NBQ0hFIGFz
IHdlbGw6IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA5NDYwOTkvCj4+
ICBBbnkgd2l0aG91dCBhIHVzZXIgaW4gdGhlIHNhbWUgc2VyaWVzIGl0IGlzIGEgY29tcGxldGUg
bm8tZ28gYW55d2F5Lgo+IElPTU1VX1FDT01fU1lTX0NBQ0hFIGRvZXMgbm90IGhhdmUgYW55IGN1
cnJlbnQgdXNlcnMgaW4gdGhlIG1haW5saW5lLCBub3IgCj4gZGlkIGl0IGhhdmUgaXQgaW4gdGhl
IHBhdGNoIHNlcmllcyBpbiB3aGljaCBpdCBnb3QgbWVyZ2VkLCB5ZXQgaXQgaXMgc3RpbGwgCj4g
cHJlc2VudD8gRnVydGhlcm1vcmUsIHRoZXJlIGFyZSBwbGFucyB0byB1cHN0cmVhbSBzdXBwb3J0
IGZvciBvbmUgb2Ygb3VyIAo+IFNvQ3MgdGhhdCBtYXkgYmVuZWZpdCBmcm9tIHRoaXMsIGFzIHNl
ZW4gaGVyZTogCj4gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvaW9tbXUvbXNnMzk2MDgu
aHRtbC4KCldoaWNoIG1lYW5zIGl0IHNob3VsZCBoYXZlIG5ldmVyIGJlZW4gbWVyZ2VkLiAgQXMg
YSBnZW5lcmFsIHBvbGljeSB3ZSBkbwpub3QgYWRkIGNvZGUgdG8gdGhlIExpbnV4IGtlcm5lbCB3
aXRob3V0IGFjdHVhbCB1c2Vycy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lvbW11
