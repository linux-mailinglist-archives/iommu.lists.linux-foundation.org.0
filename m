Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CC27F2AA3F2
	for <lists.iommu@lfdr.de>; Sat,  7 Nov 2020 09:48:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3FDAD20478;
	Sat,  7 Nov 2020 08:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3HhgdT-kTjsK; Sat,  7 Nov 2020 08:47:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 99CC02046F;
	Sat,  7 Nov 2020 08:47:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 784D9C1AD8;
	Sat,  7 Nov 2020 08:47:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B97F8C0889
 for <iommu@lists.linux-foundation.org>; Sat,  7 Nov 2020 08:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A82F2869C3
 for <iommu@lists.linux-foundation.org>; Sat,  7 Nov 2020 08:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AT3rOe4HzTG8 for <iommu@lists.linux-foundation.org>;
 Sat,  7 Nov 2020 08:47:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CDB4E869A4
 for <iommu@lists.linux-foundation.org>; Sat,  7 Nov 2020 08:47:55 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id r186so3034448pgr.0
 for <iommu@lists.linux-foundation.org>; Sat, 07 Nov 2020 00:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bZpwuF564hbZcjyk1Oa3agUsSrTimItihmfB6dOlwo0=;
 b=dNufYki4/f8inIB48XW9zbx02c1GAIXLf/NB1ZMUb20uN6nh48EVt0obJFEx0f1wXJ
 fiefojpmCv5oLzE3L79EsBU14XZqJ+R+hBlrZW5us0t7oKlxEpDk9Brw50qRyoZrsli8
 QSKxmIaCliW0kqGEUyMEV/IpOh9LIN0+kdZYZ83HFxL+Jue9U7h4k0+BId2fkRkVtvJH
 BTKqusBoNto2xEUscbF/IXHlRM5lTLmJ0fdqi56I0V9PxBxqqT0UqRNxL5iAeaQ7ffK5
 e4HgQVKEm6vZd4U75Tp+gCYaRBbC/yfkd95sxm2aMX/YOGfqDBljBc7vU+jZcOcng2TS
 8gpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bZpwuF564hbZcjyk1Oa3agUsSrTimItihmfB6dOlwo0=;
 b=LAmwX086PPjRLFfeBZ81EjGnlnaild7aM7wBIInM0dWFYohES15vBE7Z+wcImWIiXv
 VOaSVufhz4UjDbGT8i43c1VR/PdGa8DzCb35CL0OYrSlxHma4Wms9yT8H0O+Wr22yPhx
 fFkVwqXc8BKQrZNUoDk3ldtVLRHsZhGek1nDVOfDovH4UcIqZMYjK6WAQPVc+e0zyags
 e/LF5Sapb5XQ6qM2SZWFAB3FN3fdoQhRf40u6SsI2yIJlvIpbu5oXYARasBZjwIY+HgG
 ZlstEhoNzwB+cj4qJ+I1Y4HE11ATBuxhUsu/G8B82xfz+BymMkB/UxYtH4aDPzEFMClh
 w6rQ==
X-Gm-Message-State: AOAM531Dfiv7iYbHlnH/j2uZUNSmOM8Q+5WdOCCTqxq/BEd7sbVAXlYx
 2wUiKTxRVRMyWRbLJ/nJbnY=
X-Google-Smtp-Source: ABdhPJyo+FW7XO57lJER/2gj1PHntYkEnSKY/kVUOVoSnSaFsTTvdxETY9+5fopyvoRYXQNw8nKKwQ==
X-Received: by 2002:a63:381:: with SMTP id 123mr5167410pgd.112.1604738875435; 
 Sat, 07 Nov 2020 00:47:55 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id f71sm4474710pfa.155.2020.11.07.00.47.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 07 Nov 2020 00:47:54 -0800 (PST)
Date: Sat, 7 Nov 2020 00:35:39 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com, joro@8bytes.org
Subject: Re: [PATCH v4 0/2] iommu/tegra-smmu: Two followup changes
Message-ID: <20201107083538.GA24113@Asurada-Nvidia>
References: <20200929061325.10197-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929061325.10197-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, hch@infradead.org, linux-tegra@vger.kernel.org,
 digetx@gmail.com
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

On Mon, Sep 28, 2020 at 11:13:23PM -0700, Nicolin Chen wrote:
> Two followup patches for tegra-smmu:
> PATCH-1 is a clean-up patch for the recently applied SWGROUP change.
> PATCH-2 fixes a potential race condition

These two changes have Acked-by and Reviewed-by for a month already.
Who can apply them?

Thanks
Nic

> Changelog
> v3->v4:
>  * PATCH-2: Fixed typo in subject
> v2->v3:
>  * PATCH-2: renamed "err_unlock" to "unlock"
> v1->v2:
>  * Separated first two changs of V1 so they may get applied first,
>    since the other three changes need some extra time to finalize.
> 
> Nicolin Chen (2):
>   iommu/tegra-smmu: Unwrap tegra_smmu_group_get
>   iommu/tegra-smmu: Expand mutex protection range
> 
>  drivers/iommu/tegra-smmu.c | 53 ++++++++++++++++++--------------------
>  1 file changed, 25 insertions(+), 28 deletions(-)
> 
> -- 
> 2.17.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
