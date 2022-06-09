Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AB45442E5
	for <lists.iommu@lfdr.de>; Thu,  9 Jun 2022 07:07:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 658FF83E18;
	Thu,  9 Jun 2022 05:07:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8zldUlmFi4F; Thu,  9 Jun 2022 05:07:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7EF2083E1C;
	Thu,  9 Jun 2022 05:07:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E766C002D;
	Thu,  9 Jun 2022 05:07:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43130C002D;
 Thu,  9 Jun 2022 05:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22B0340BE0;
 Thu,  9 Jun 2022 05:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AkwHeAxMu8o7; Thu,  9 Jun 2022 05:07:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1397D40BDF;
 Thu,  9 Jun 2022 05:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=acG/hWi7Fz9ui2xVxpMoGeBP7vrmuNMLdX3ejzV7aPc=; b=MZhm3nf6mKFSlcr8dK8ijoBLa2
 MBmpr98pFWNa8b6ut+XZouG4H5T08bSJ23S8eyxslIMTr4C/O2zuvnG2/qsMxG0x37tmaxvgijfIb
 lGXyW4Q+2Io60XdLfGcV4rp/RIywa2u5fO9NieV0COBKOJzrFJhvVfmdj+5pSGWt/lb4HHj77Z/qa
 w661jXNSO/l+LgOue5Ca0yCP7G8O+ptXdbp8dSD1Vzdtm86SSvktBkKXYdbPsB22/xE+l3YTcUINL
 9HMTg+plhTcoM0gRCPZ1oapj04vRnOV9EHBOaOpaoHqGEW+z8Mh7/21uIp1vsKiXFvwHo2LUpgWRB
 KVKRCt6A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nzAOE-00GnS5-8r; Thu, 09 Jun 2022 05:07:26 +0000
Date: Wed, 8 Jun 2022 22:07:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH RFC v1 7/7] swiotlb: fix the slot_addr() overflow
Message-ID: <YqGADnHAP7HYPvRr@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-8-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609005553.30954-8-dongli.zhang@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: jgross@suse.com, dave.hansen@linux.intel.com, mst@redhat.com,
 konrad.wilk@oracle.com, mpe@ellerman.id.au, jasowang@redhat.com,
 x86@kernel.org, joe.jin@oracle.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, hch@infradead.org,
 iommu@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org, tglx@linutronix.de,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Jun 08, 2022 at 05:55:53PM -0700, Dongli Zhang wrote:
> +#define slot_addr(start, idx)	((start) + \
> +				(((unsigned long)idx) << IO_TLB_SHIFT))

Please just convert it to an inline function.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
