Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3CE1E7E0B
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 15:08:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED8F8873DD;
	Fri, 29 May 2020 13:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9arIwaKyD9p0; Fri, 29 May 2020 13:08:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4DA19873DA;
	Fri, 29 May 2020 13:08:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31B05C016F;
	Fri, 29 May 2020 13:08:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88E94C016F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 13:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3941C883FD
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 13:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7NB2YdEV+1A for <iommu@lists.linux-foundation.org>;
 Fri, 29 May 2020 13:08:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 23C0E883FC
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 13:08:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 14C65327; Fri, 29 May 2020 15:08:39 +0200 (CEST)
Date: Fri, 29 May 2020 15:08:37 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 00/10] iommu/amd: Updates and Cleanups
Message-ID: <20200529130837.GC14598@8bytes.org>
References: <20200527115313.7426-1-joro@8bytes.org>
 <855af88c-66b2-29c1-a184-40d52592e38e@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <855af88c-66b2-29c1-a184-40d52592e38e@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de,
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

On Fri, May 29, 2020 at 07:15:13PM +0700, Suravee Suthikulpanit wrote:
> Thank you for cleaning up.
> 
> Reviewed-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>

Thanks for you review, Suravee. Patches are now applied.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
