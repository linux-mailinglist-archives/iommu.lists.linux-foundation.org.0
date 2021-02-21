Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD7C320825
	for <lists.iommu@lfdr.de>; Sun, 21 Feb 2021 04:06:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E348785F0E;
	Sun, 21 Feb 2021 03:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DOk0HtLYq_id; Sun, 21 Feb 2021 03:06:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7DCDB85EF0;
	Sun, 21 Feb 2021 03:06:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59A40C0012;
	Sun, 21 Feb 2021 03:06:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F084C0001
 for <iommu@lists.linux-foundation.org>; Sun, 21 Feb 2021 03:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2721285EF0
 for <iommu@lists.linux-foundation.org>; Sun, 21 Feb 2021 03:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYMQul_s5wMJ for <iommu@lists.linux-foundation.org>;
 Sun, 21 Feb 2021 03:06:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from angie.orcam.me.uk (angie.orcam.me.uk [157.25.102.26])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E853985EC6
 for <iommu@lists.linux-foundation.org>; Sun, 21 Feb 2021 03:06:34 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id CC4BD92009C; Sun, 21 Feb 2021 04:06:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id BCFAC92009B;
 Sun, 21 Feb 2021 04:06:30 +0100 (CET)
Date: Sun, 21 Feb 2021 04:06:30 +0100 (CET)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/6] MIPS/malta: simplify plat_setup_iocoherency
In-Reply-To: <20210210095641.23856-2-hch@lst.de>
Message-ID: <alpine.DEB.2.21.2102210403580.2021@angie.orcam.me.uk>
References: <20210210095641.23856-1-hch@lst.de>
 <20210210095641.23856-2-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Wed, 10 Feb 2021, Christoph Hellwig wrote:

> Given that plat_mem_setup runs before earlyparams are handled and malta
> selects CONFIG_DMA_MAYBE_COHERENT, coherentio can only be set to
> IO_COHERENCE_DEFAULT at this point.  So remove the checking for other
> options and merge plat_enable_iocoherency into plat_setup_iocoherency
> to simplify the code a bit.

Tested-by: Maciej W. Rozycki <macro@orcam.me.uk>

 FWIW,

  Maciej
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
