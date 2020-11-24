Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 831FE2C243A
	for <lists.iommu@lfdr.de>; Tue, 24 Nov 2020 12:35:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1349387292;
	Tue, 24 Nov 2020 11:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0x5IhoBmgZFQ; Tue, 24 Nov 2020 11:35:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9EBE387293;
	Tue, 24 Nov 2020 11:35:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 843DFC0052;
	Tue, 24 Nov 2020 11:35:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3D3FC0052
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 11:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A55B187292
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 11:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id slWTtBeYOTTn for <iommu@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 11:35:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9166187291
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 11:35:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 94C046736F; Tue, 24 Nov 2020 12:35:12 +0100 (CET)
Date: Tue, 24 Nov 2020 12:35:12 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH] WIP! media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20201124113512.GA21974@lst.de>
References: <20200930160917.1234225-9-hch@lst.de>
 <20201118142546.170621-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118142546.170621-1-ribalda@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

T24gV2VkLCBOb3YgMTgsIDIwMjAgYXQgMDM6MjU6NDZQTSArMDEwMCwgUmljYXJkbyBSaWJhbGRh
IHdyb3RlOgo+IE9uIGFyY2hpdGVjdHVyZXMgd2hlcmUgdGhlIGlzIG5vIGNvaGVyZW50IGNhY2hp
bmcgc3VjaCBhcyBBUk0gdXNlIHRoZQo+IGRtYV9hbGxvY19ub25jb250aWd1b3MgQVBJIGFuZCBo
YW5kbGUgbWFudWFsbHkgdGhlIGNhY2hlIGZsdXNoaW5nIHVzaW5nCj4gZG1hX3N5bmNfc2luZ2xl
KCkuCj4gCj4gV2l0aCB0aGlzIHBhdGNoIG9uIHRoZSBhZmZlY3RlZCBhcmNoaXRlY3R1cmVzIHdl
IGNhbiBtZWFzdXJlIHVwIHRvIDIweAo+IHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IGluIHV2Y192
aWRlb19jb3B5X2RhdGFfd29yaygpLgoKVGhpcyBoYXMgYSBidW5jaCBvZiBjcmF6eSBsb25nIGxp
bmVzLCBidXQgb3RoZXJ3aXNlIGxvb2tzIGZpbmUgdG8gbWUuCgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFJpY2FyZG8gUmliYWxkYSA8cmliYWxkYUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gCj4gVGhpcyBw
YXRjaCBkZXBlbmRzIG9uIGRtYV9hbGxvY19jb250aWd1b3VzIEFQSe+/vDEzMTUzNTFkaWZmbWJv
eHNlcmllcwoKSG93IGRvIHdlIHdhbnQgdG8gcHJvY2VlZD8gIERvIHRoZSBtZWRpYSBtYWludGFp
bmVycyB3YW50IHRvIHBpY2sgdXAKdGhhdCBwYXRjaD8gIFNob3VsZCBJIHBpY2sgdXAgdGhlIG1l
ZGlhIHBhdGNoIGluIHRoZSBkbWEtbWFwcGluZyB0cmVlPwoKQ2FuIHlvdSByZXNwb3N0IGEgY29t
YmluZWQgc2VyaWVzIHRvIGdldCBzdGFydGVkPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vaW9tbXU=
