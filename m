Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 69752229943
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 15:33:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DAFA38855E;
	Wed, 22 Jul 2020 13:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3WUtCG0yCHg; Wed, 22 Jul 2020 13:33:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8939888606;
	Wed, 22 Jul 2020 13:33:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53267C004C;
	Wed, 22 Jul 2020 13:33:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09C20C004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E55CE885C8
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4elJhTsjKPM for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 13:33:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 867D38855E
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:33:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 091402C8; Wed, 22 Jul 2020 15:33:24 +0200 (CEST)
Date: Wed, 22 Jul 2020 15:33:23 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [GIT PULL] iommu/arm-smmu: Updates for 5.9
Message-ID: <20200722133323.GG27672@8bytes.org>
References: <20200721080352.GA13023@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721080352.GA13023@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kernel-team@android.com, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

Hi Will,

On Tue, Jul 21, 2020 at 09:03:53AM +0100, Will Deacon wrote:
> Please pull these Arm SMMU driver updates for 5.9. Summary is in the tag,
> but the main thing is support for two new SoC integrations, one of which
> is considerably more brain-dead than the other (determining which one is
> left as an exercise to the reader although the diffstat is fairly revealing).

:)

> The following changes since commit 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68:
> 
>   Linux 5.8-rc3 (2020-06-28 15:00:24 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git tags/arm-smmu-updates

Pulled, thanks. Given the number of arm-smmu* files it probably makes
sense to create a drivers/iommu/arm-smmu/ directory and move it all
there. If you agree feel free to send this as an additional patch on-top
of this pull-request.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
