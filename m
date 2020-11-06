Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C674E2A9782
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 15:18:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 850EE86935;
	Fri,  6 Nov 2020 14:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiCzSZYI8mL6; Fri,  6 Nov 2020 14:18:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1514386901;
	Fri,  6 Nov 2020 14:18:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09256C0889;
	Fri,  6 Nov 2020 14:18:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E14A1C0889
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 14:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DB51587353
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 14:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbrntGqjYQRa for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 14:18:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8176E87268
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 14:18:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CF4FA68B02; Fri,  6 Nov 2020 15:18:43 +0100 (CET)
Date: Fri, 6 Nov 2020 15:18:43 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 3/6] RDMA/core: remove use of dma_virt_ops
Message-ID: <20201106141843.GD23884@lst.de>
References: <20201105074205.1690638-1-hch@lst.de>
 <20201105074205.1690638-4-hch@lst.de> <20201105175253.GA35235@nvidia.com>
 <20201105175816.GH36674@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105175816.GH36674@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>
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

T24gVGh1LCBOb3YgMDUsIDIwMjAgYXQgMDE6NTg6MTZQTSAtMDQwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ID4gSSBub3RpY2VkIHRoZXJlIHdlcmUgYSBjb3VwbGUgb2YgcGxhY2VzIGV4cGVj
dGluZyBkbWFfZGV2aWNlIHRvIGJlIHNldAo+ID4gdG8gIU5VTEw6Cj4gPiAKPiA+IGRyaXZlcnMv
aW5maW5pYmFuZC9jb3JlL3VtZW0uYzogICAgICAgICAgICAgICAgIGRtYV9nZXRfbWF4X3NlZ19z
aXplKGRldmljZS0+ZG1hX2RldmljZSksIHNnLCBucGFnZXMsCj4gPiBkcml2ZXJzL252bWUvaG9z
dC9yZG1hLmM6ICAgICAgIGN0cmwtPmN0cmwubnVtYV9ub2RlID0gZGV2X3RvX25vZGUoY3RybC0+
ZGV2aWNlLT5kZXYtPmRtYV9kZXZpY2UpOwo+IAo+IERvbid0IGtub3cgbXVjaCBhYm91dCBOVU1B
LCBidXQgZG8geW91IHRoaW5rIHRoZSBpYiBkZXZpY2Ugc2V0dXAKPiBzaG91bGQgYXV0b2NvcHkg
dGhlIG51bWEgbm9kZSBmcm9tIHRoZSBkbWFfZGV2aWNlIHRvIHRoZSBpYl9kZXZpY2UgYW5kCj4g
dGhpcyB1c2FnZSBzaG91bGQganVzdCByZWZlciB0byB0aGUgaWJfZGV2aWNlPwoKRllJLCBJIGVu
ZGVkIHVwIGp1c3QgbGlmdGluZyB0aGUgaWJkZXZfdG9fbm9kZSBmcm9tIHJkcyB0byBpYl92ZXJi
cy5oLiAgVGhhdCB1c2VzCnRoZSBwYXJlbnQgcG9pbnRlciBpbiB0aGUgaWJfZGV2aWNlIGFuZCBz
aG91bGQgZ2VuZXJhbGx5IHdvcmsgb2suICBJZiBub3Qgd2UgY2FuCmltcHJvdmUg0ZZ0IGFzIHdl
IG5vdyBoYXZlIGEgcHJvcGVyIGFic3RyYWN0aW9uLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vaW9tbXU=
