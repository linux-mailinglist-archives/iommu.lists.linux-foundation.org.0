Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E19752394
	for <lists.iommu@lfdr.de>; Tue, 25 Jun 2019 08:33:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 16A2EA7F;
	Tue, 25 Jun 2019 06:33:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 799728E2
	for <iommu@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 06:33:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2328E710
	for <iommu@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 06:33:33 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 0D43868B05; Tue, 25 Jun 2019 08:33:02 +0200 (CEST)
Date: Tue, 25 Jun 2019 08:33:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] switch m68k to use the generic remapping DMA allocator
Message-ID: <20190625063301.GB29561@lst.de>
References: <20190614102126.8402-1-hch@lst.de>
	<CAMuHMdUbuTc+MWqDFw=RnYxtiNQPQkzJ91KDuAQbhMq533tBCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUbuTc+MWqDFw=RnYxtiNQPQkzJ91KDuAQbhMq533tBCQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>,
	Christoph Hellwig <hch@lst.de>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, Jun 24, 2019 at 09:16:30AM +0200, Geert Uytterhoeven wrote:
> Doing
> 
> -       select DMA_DIRECT_REMAP if MMU && !COLDFIRE
> +       select DMA_DIRECT_REMAP if MMU && !COLDFIRE && !SUN3
> 
> in arch/m68k/Kconfig fixes the build.
> 
> Alternatively, you could use:
> 
> -       select DMA_DIRECT_REMAP if MMU && !COLDFIRE
> +       select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE

The latter might be a little cleaner.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
