Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CBB547F51
	for <lists.iommu@lfdr.de>; Mon, 13 Jun 2022 08:05:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A0FA4024F;
	Mon, 13 Jun 2022 06:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1WGzv3WAyvIg; Mon, 13 Jun 2022 06:04:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 743A840221;
	Mon, 13 Jun 2022 06:04:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42A85C002D;
	Mon, 13 Jun 2022 06:04:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0C16C002D;
 Mon, 13 Jun 2022 06:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB1EE40223;
 Mon, 13 Jun 2022 06:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hCrAwcADHaU; Mon, 13 Jun 2022 06:04:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 752EE40221;
 Mon, 13 Jun 2022 06:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=b1PoY1uKlcNqy2edTiTsVL/coyRDE9FCOo38ncps/ZM=; b=asqORLv9fFtRmH0mbdAsX62PEY
 2oM2wjfo4NwjYVsp3GvIcXnsJO9DKRj8XCXW1E4suTxpr2g8LP73vdRMEKnbzqlgoyXVfnbMS54bD
 FBTwd3vKQ1myxZku0vIkaOTi9LwMJKMefz6tfktugd6A88h7XFJ8zVDM64ozYM6Q5rABwX6AKb2fa
 8zxSLwNzq9CLLB7mjw/mVXMIKzM5UZnMYu4GyUGLrYpMbVB2c2wQRdURbri0g+CmKZJ4dWe95IH7X
 ApNaap56yK/FeNrP1odSM3lUI36xBVvmY3EYL/xIb/6e2D8T1L0tLE8e0+gIuJwvSLdsxahG1pSYz
 SAgdlhuA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o0dBu-001aZ9-At; Mon, 13 Jun 2022 06:04:46 +0000
Date: Sun, 12 Jun 2022 23:04:46 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH RFC v1 4/7] swiotlb: to implement io_tlb_high_mem
Message-ID: <YqbTfi/h2P24ynQZ@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-5-dongli.zhang@oracle.com>
 <YqF/sphJj6n+22Si@infradead.org>
 <e6345c27-78fd-be72-9551-1d1fd5db37a4@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6345c27-78fd-be72-9551-1d1fd5db37a4@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: jgross@suse.com, dave.hansen@linux.intel.com, mst@redhat.com,
 konrad.wilk@oracle.com, mpe@ellerman.id.au, jasowang@redhat.com,
 x86@kernel.org, joe.jin@oracle.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 mingo@redhat.com, bp@alien8.de, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMDI6NTY6MDhQTSAtMDcwMCwgRG9uZ2xpIFpoYW5nIHdy
b3RlOgo+IFNpbmNlIHRoaXMgcGF0Y2ggZmlsZSBoYXMgMjAwKyBsaW5lcywgd291bGQgeW91IHBs
ZWFzZSBoZWxwIGNsYXJpZnkgd2hhdCBkb2VzCj4gJ3RoaXMnIGluZGljYXRlPwoKVGhpcyBpbmRp
Y2F0ZXMgdGhhdCBhbnkgY2hvaWNlIG9mIGEgZGlmZmVyZW50IHN3aW90bGIgcG9vbHMgbmVlZHMg
dG8KYmUgaGlkZGVuIGluc2lkZSBvZiDRlXdpb3RsYi4gIFRoZSBkbWEgbWFwcGluZyBBUEkgYWxy
ZWFkeSBwcm92aWRlcwpzd2lvdGxiIHRoZSBhZGRyZXNzYWJpbGl0eSByZXF1aXJlbWVudCBmb3Ig
dGhlIGRldmljZS4gIFNpbWlsYXJseSB3ZQphbHJlYWR5IGhhdmUgYSBTV0lPVExCX0FOWSBmbGFn
IHRoYXQgc3dpdGNoZXMgdG8gYSA2NC1iaXQgYnVmZmVyCmJ5IGRlZmF1bHQsIHdoaWNoIHdlIGNh
biBjaGFuZ2UgdG8sIG9yIHJlcGxhY2Ugd2l0aCBhIGZsYWcgdGhhdAphbGxvY2F0ZXMgYW4gYWRk
aXRpb25hbCBidWZmZXIgdGhhdCBpcyBub3QgYWRkcmVzc2luZyBsaW1pdGVkLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QK
aW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
