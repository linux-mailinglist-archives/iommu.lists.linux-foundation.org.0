Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B59A20F1E0
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 11:43:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BC1BE221D9;
	Tue, 30 Jun 2020 09:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5YTnvvP6Fqv4; Tue, 30 Jun 2020 09:43:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8922A220CA;
	Tue, 30 Jun 2020 09:43:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7ECE0C016E;
	Tue, 30 Jun 2020 09:43:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DB50C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5C452220A2
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8XUZDIw-D9ZW for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 09:43:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id B67CA20352
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:43:13 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4775726B; Tue, 30 Jun 2020 11:43:12 +0200 (CEST)
Date: Tue, 30 Jun 2020 11:43:10 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jerry Snitselaar <jsnitsel@redhat.com>
Subject: Re: [PATCH 1/2] iommu/vt-d: Move Kconfig and Makefile bits down into
 intel directory
Message-ID: <20200630094310.GF28824@8bytes.org>
References: <20200612231100.293734-1-jsnitsel@redhat.com>
 <20200612231100.293734-2-jsnitsel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612231100.293734-2-jsnitsel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Jerry,

On Fri, Jun 12, 2020 at 04:10:59PM -0700, Jerry Snitselaar wrote:
> Move Intel Kconfig and Makefile bits down into intel directory
> with the rest of the Intel specific files.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
> ---
>  drivers/iommu/Kconfig        | 86 +-----------------------------------
>  drivers/iommu/Makefile       |  8 +---
>  drivers/iommu/intel/Kconfig  | 86 ++++++++++++++++++++++++++++++++++++
>  drivers/iommu/intel/Makefile |  7 +++

The patches do not apply to v5.8-rc3, can you please rebase them and
resend?

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
