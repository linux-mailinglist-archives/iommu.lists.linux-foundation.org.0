Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8312D278766
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 14:39:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 418AC86B83;
	Fri, 25 Sep 2020 12:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cITrWPp1oJAf; Fri, 25 Sep 2020 12:39:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BFB59869ED;
	Fri, 25 Sep 2020 12:39:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8EC2C0859;
	Fri, 25 Sep 2020 12:39:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB421C0859
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 12:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C4AF386CE0
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 12:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2uH+gif9kPl3 for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 12:39:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D639786C6D
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 12:39:40 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D804920BED;
 Fri, 25 Sep 2020 12:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601037580;
 bh=Ec2OR35i0PEha7HydsenbD0l00v+EgADLMUcwhnoiKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bJdvlBtFsrw/4edYVucgcGP4T1ybqo87e3hwOWxxZSVXa37m8p0IkSpZKdK4rmS6Q
 EalYQ2/wn3+/HS2CdPSNn3/WRJRJoEP099YIWMEfduQGaVK92XBCbRMoohp2JvhcxW
 FyxbGFd+gm2ng1f+VPoJ1xw+QFz0ButQNIWgjC4o=
Date: Fri, 25 Sep 2020 14:39:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH] iommu/amd: Use cmpxchg_double() when updating 128-bit IRTE
Message-ID: <20200925123955.GA2732292@kroah.com>
References: <20200925114505.232280-1-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925114505.232280-1-suravee.suthikulpanit@amd.com>
Cc: sashal@kernel.org, Joerg Roedel <jroedel@suse.de>, brijesh.singh@amd.com,
 Jon.Grimm@amd.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

On Fri, Sep 25, 2020 at 11:45:05AM +0000, Suravee Suthikulpanit wrote:
> When using 128-bit interrupt-remapping table entry (IRTE) (a.k.a GA mode),
> current driver disables interrupt remapping when it updates the IRTE
> so that the upper and lower 64-bit values can be updated safely.
> 
> However, this creates a small window, where the interrupt could
> arrive and result in IO_PAGE_FAULT (for interrupt) as shown below.
> 
>   IOMMU Driver            Device IRQ
>   ============            ===========
>   irte.RemapEn=0
>        ...
>    change IRTE            IRQ from device ==> IO_PAGE_FAULT !!
>        ...
>   irte.RemapEn=1
> 
> This scenario has been observed when changing irq affinity on a system
> running I/O-intensive workload, in which the destination APIC ID
> in the IRTE is updated.
> 
> Instead, use cmpxchg_double() to update the 128-bit IRTE at once without
> disabling the interrupt remapping. However, this means several features,
> which require GA (128-bit IRTE) support will also be affected if cmpxchg16b
> is not supported (which is unprecedented for AMD processors w/ IOMMU).
> 
> Cc: stable@vger.kernel.org
> Fixes: 880ac60e2538 ("iommu/amd: Introduce interrupt remapping ops structure")
> Reported-by: Sean Osborne <sean.m.osborne@oracle.com>
> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> Tested-by: Erik Rockstrom <erik.rockstrom@oracle.com>
> Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
> Link: https://lore.kernel.org/r/20200903093822.52012-3-suravee.suthikulpanit@amd.com
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
> Note: This patch is the back-port on top of the stable branch linux-5.4.y
> for the upstream commit e52d58d54a32 ("iommu/amd: Use cmpxchg_double() when
> updating 128-bit IRTE") since the original patch does not apply cleanly.

Now queued up, thanks.

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
