Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3813A3BFC
	for <lists.iommu@lfdr.de>; Fri, 11 Jun 2021 08:22:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CDC140649;
	Fri, 11 Jun 2021 06:22:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QD5cfNjttRKn; Fri, 11 Jun 2021 06:22:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 686204064A;
	Fri, 11 Jun 2021 06:22:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 232E2C000B;
	Fri, 11 Jun 2021 06:22:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88B6BC000B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 06:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6855F83B62
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 06:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RSXWXnuvxgsl for <iommu@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 06:21:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D7ED83B5F
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 06:21:58 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C56F968AFE; Fri, 11 Jun 2021 08:21:53 +0200 (CEST)
Date: Fri, 11 Jun 2021 08:21:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>
Subject: Re: swiotlb/caamjr regression (Was: [GIT PULL] (swiotlb)
 stable/for-linus-5.12)
Message-ID: <20210611062153.GA30906@lst.de>
References: <YDkbCHHBUOmfI59K@Konrads-MacBook-Pro.local>
 <YL7XXNOnbaDgmTB9@atmark-techno.com>
 <2e899de2-4b69-c4b6-33a6-09fb8949d2fd@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e899de2-4b69-c4b6-33a6-09fb8949d2fd@nxp.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Dominique MARTINET <dominique.martinet@atmark-techno.com>,
 Aymen Sghaier <aymen.sghaier@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lukas Hartmann <lukas@mntmn.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Jianxiong Gao <jxgao@google.com>
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

T24gVGh1LCBKdW4gMTAsIDIwMjEgYXQgMDU6NTI6MDdQTSArMDMwMCwgSG9yaWEgR2VhbnTEgyB3
cm90ZToKPiBJJ3ZlIG5vdGljZWQgdGhlIGZhaWx1cmUgYWxzbyBpbiB2NS4xMCBhbmQgdjUuMTEg
c3RhYmxlIGtlcm5lbHMsCj4gc2luY2UgdGhlIHBhdGNoIHNldCBoYXMgYmVlbiBiYWNrcG9ydGVk
LgoKRllJLCB0aGVyZSBoYXMgYmVlbiBhIHBhdGNoIG9uIHRoZSBsaXN0IHRoYXQgc2hvdWxkIGhh
dmUgZml4ZWQgdGhpcwpmb3IgYWJvdXQgYSBtb250aDoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWlvbW11LzIwMjEwNTEwMDkxODE2LkdBMjA4NEBsc3QuZGUvVC8jbTBkMGRmNjQ5MDM1
MGEwOGRjYzI0YzkwODZjOGVkYzE2NWI0MDJkNmYKCmJ1dCBpdCBzZWVtcyBsaWtlIGl0IG5ldmVy
IGdvdCBwaWNrZWQgdXAuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21t
dQ==
