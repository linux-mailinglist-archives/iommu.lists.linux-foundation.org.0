Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DA9307C99
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 18:35:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E3C887442;
	Thu, 28 Jan 2021 17:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LPNEnJXgGdG; Thu, 28 Jan 2021 17:34:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C99018742F;
	Thu, 28 Jan 2021 17:34:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACA8DC013A;
	Thu, 28 Jan 2021 17:34:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C054C013A
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 17:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 47A7386B4A
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 17:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RngQ7z6748Hl for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 17:34:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D4EC186B50
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 17:34:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91CA964D9A;
 Thu, 28 Jan 2021 17:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611855297;
 bh=TkMt06C39KAtu27x1DMMhjzHHmvklcYVEo9Dtplc7bE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QXEDB2oB667WqtQ3FaoY5JbM3br+ouLPdfGippereJ3bazR3YvSFM3/yMYFpa5s9m
 I3SLgnoW2gL6Jbrl0kvEocY30o4L6ccfLwVjicpke430MgCinys1z1Y8ZjlkpNLhpE
 g1awn+IWlMu9bBOvr2kGhOYvZPJdtnAxTl/ElWA1Kkxp2dBivL/yinx1thffOp56BA
 c09mNreubOtXTYEMkNE4RDILxeC7fCCmKi/l/KLiP9RLTZJYJtMrr+UWxsfX8dlkoE
 8oS+ZuDaIDSNTtp+vAovpleEwM5FNHZlLbeagoI4a8EUOCNol4DfH7U9m4l+ZR9e07
 FxoB6QhkZCDiw==
Date: Fri, 29 Jan 2021 02:34:51 +0900
From: Keith Busch <kbusch@kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 2/3] Add swiotlb offset preserving mapping when
 dma_dma_parameters->page_offset_mask is non zero.
Message-ID: <20210128173451.GA31631@redsun51.ssa.fujisawa.hgst.com>
References: <20210128003829.1892018-1-jxgao@google.com>
 <20210128003829.1892018-3-jxgao@google.com>
 <YBLxMP3sr71BTL+d@Konrads-MacBook-Pro.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBLxMP3sr71BTL+d@Konrads-MacBook-Pro.local>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: heikki.krogerus@linux.intel.com, sagi@grimberg.me, saravanak@google.com,
 marcorr@google.com, gregkh@linuxfoundation.org, rafael.j.wysocki@intel.com,
 linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, axboe@fb.com,
 bgolaszewski@baylibre.com, iommu@lists.linux-foundation.org, jroedel@suse.de,
 linux-nvme@lists.infradead.org, dan.j.williams@intel.com,
 Jianxiong Gao <jxgao@google.com>, robin.murphy@arm.com, hch@lst.de
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

On Thu, Jan 28, 2021 at 12:15:28PM -0500, Konrad Rzeszutek Wilk wrote:
> On Wed, Jan 27, 2021 at 04:38:28PM -0800, Jianxiong Gao wrote:
> > For devices that need to preserve address offset on mapping through
> > swiotlb, this patch adds offset preserving based on page_offset_mask
> > and keeps the offset if the mask is non zero. This is needed for
> > device drivers like NVMe.
> 
> <scratches his head>
> 
> Didn't you send this patch like a month ago and someone pointed
> out that the right fix would be in the NVMe driver?
> 
> Is there an issue with fixing the NVMe driver?

You got it backwards. The initial "fix" used a flag specific to the nvme
driver, and it was pointed out that it should just be the generic
behaviour.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
