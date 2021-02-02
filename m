Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC6430C767
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 18:22:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5339885116;
	Tue,  2 Feb 2021 17:22:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ibw6-DLcWFcl; Tue,  2 Feb 2021 17:22:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BD10F85092;
	Tue,  2 Feb 2021 17:22:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F12BC013A;
	Tue,  2 Feb 2021 17:22:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7ECCC013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 17:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D0D7A86DF0
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 17:22:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zr+1xaluV4iP for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 17:22:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A59C286DEE
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 17:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612286526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3tNOzSSX48fk87F3yP6GVgcUiDHmEx0tM3rnjbmDtU=;
 b=W+KxEgS+jMqbP2JoargjwGZXrv5CoCvXxiGA/K4bJU973F5BW9MxdCLcoaUJAzqxvysGkX
 zH3nTJlq8MnnXUXWn7GHxkQ/70tBKMF3AxoSNNRjHNG8UPv1wZ/0t/ZrDwAW6+krZ3+WCL
 H9hYhFP3F0V/k1RKNbydILZ+0fsfnFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-0KyRTmpPNlGuBE9gPKJx7g-1; Tue, 02 Feb 2021 12:22:02 -0500
X-MC-Unique: 0KyRTmpPNlGuBE9gPKJx7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 675548049D0;
 Tue,  2 Feb 2021 17:21:58 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F4F65D9D5;
 Tue,  2 Feb 2021 17:21:56 +0000 (UTC)
Date: Tue, 2 Feb 2021 10:21:55 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH v3 0/2] vfio/iommu_type1: some fixes
Message-ID: <20210202102155.60341d38@omen.home.shazbot.org>
In-Reply-To: <20210122092635.19900-1-zhukeqian1@huawei.com>
References: <20210122092635.19900-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Mark Rutland <mark.rutland@arm.com>, jiangkunkun@huawei.com,
 kvm@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, wanghaibin.wang@huawei.com,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, James Morse <james.morse@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
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

On Fri, 22 Jan 2021 17:26:33 +0800
Keqian Zhu <zhukeqian1@huawei.com> wrote:

> v3:
>  - Populate bitmap unconditionally.
>  - Sanity check notifier when remove all domains.
> 
> v2:
>  - Address suggestions from Alex.
>  - Remove unnecessary patches.
>  
> 
> Keqian Zhu (2):
>   vfio/iommu_type1: Populate full dirty when detach non-pinned group
>   vfio/iommu_type1: Fix some sanity checks in detach group
> 
>  drivers/vfio/vfio_iommu_type1.c | 50 +++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 24 deletions(-)
> 

Applied to vfio next branch for v5.12, dropped WARN_ON in release on
patch 2.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
