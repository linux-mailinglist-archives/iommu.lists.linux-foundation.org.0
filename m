Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA31640B6
	for <lists.iommu@lfdr.de>; Wed, 19 Feb 2020 10:46:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B866385C5E;
	Wed, 19 Feb 2020 09:46:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LyaCJ4nmDrGJ; Wed, 19 Feb 2020 09:46:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8911D85413;
	Wed, 19 Feb 2020 09:46:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6ECCBC013E;
	Wed, 19 Feb 2020 09:46:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3330DC013E
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 09:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2121084031
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 09:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFDZfgN7MR4X for <iommu@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 09:46:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A039782383
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 09:46:09 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 38850346; Wed, 19 Feb 2020 10:46:06 +0100 (CET)
Date: Wed, 19 Feb 2020 10:46:04 +0100
From: Joerg Roedel <joro@8bytes.org>
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>
Subject: Re: [RFC PATCH] iommu/dma: Allow drivers to reserve an iova range
Message-ID: <20200219094604.GI22063@8bytes.org>
References: <1581721096-16235-1-git-send-email-isaacm@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1581721096-16235-1-git-send-email-isaacm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kernel-team@android.com, iommu@lists.linux-foundation.org,
 pratikp@codeaurora.org, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>
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

On Fri, Feb 14, 2020 at 02:58:16PM -0800, Isaac J. Manjarres wrote:
> From: Liam Mark <lmark@codeaurora.org>
> 
> Some devices have a memory map which contains gaps or holes.
> In order for the device to have as much IOVA space as possible,
> allow its driver to inform the DMA-IOMMU layer that it should
> not allocate addresses from these holes.
> 
> Change-Id: I15bd1d313d889c2572d0eb2adecf6bebde3267f7
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>

Ideally this is something put into the IOMMU firmware table by the
platform firmware. If its not there, a quirk is the best way to handle
this.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
