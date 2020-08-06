Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AA23E23DB02
	for <lists.iommu@lfdr.de>; Thu,  6 Aug 2020 15:55:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6895D86DAD;
	Thu,  6 Aug 2020 13:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VFIStcRdnJqD; Thu,  6 Aug 2020 13:55:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A9A8A86DAB;
	Thu,  6 Aug 2020 13:55:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9187AC004C;
	Thu,  6 Aug 2020 13:55:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C934C004C
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 13:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 388E988052
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 13:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xW0pwPxtSiIb for <iommu@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 13:55:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C574C88058
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 13:55:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AA0EC68D0D; Thu,  6 Aug 2020 15:55:25 +0200 (CEST)
Date: Thu, 6 Aug 2020 15:55:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v2 2/2] dma-pool: Only allocate from CMA when in same
 memory zone
Message-ID: <20200806135525.GA4380@lst.de>
References: <20200803160956.19235-1-nsaenzjulienne@suse.de>
 <20200803160956.19235-3-nsaenzjulienne@suse.de>
 <20200804060633.GA7368@lst.de>
 <e0b2a00c8cf86cb1a91804942d35c9d4b98e9f9f.camel@suse.de>
 <20200806051814.GA10143@lst.de>
 <3a530804ad5aa96d2502da8ee3e8650b0b477c0f.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a530804ad5aa96d2502da8ee3e8650b0b477c0f.camel@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: amit.pundir@linaro.org, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 rientjes@google.com, Robin Murphy <robin.murphy@arm.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, Aug 06, 2020 at 01:50:29PM +0200, Nicolas Saenz Julienne wrote:
> > The latter is pretty much what I expect, as we only support the default and
> > per-device DMA CMAs.
> 
> Fair enough, should I send a v3 with everything cleaned-up/rebased, or you'd
> rather pick it up from your version?

Please just resend the whole thing. 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
