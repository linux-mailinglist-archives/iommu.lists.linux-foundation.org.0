Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B0C3A0E9E
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 10:15:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A65A9400D4;
	Wed,  9 Jun 2021 08:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6AWjWiTy-3e; Wed,  9 Jun 2021 08:15:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 78EC8402EF;
	Wed,  9 Jun 2021 08:15:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48677C000B;
	Wed,  9 Jun 2021 08:15:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85243C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 08:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 734B4608B5
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 08:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iw-_BLaYYmsJ for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 08:15:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CABE9606E5
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 08:15:51 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 58D2C36A; Wed,  9 Jun 2021 10:15:49 +0200 (CEST)
Date: Wed, 9 Jun 2021 10:15:48 +0200
From: Joerg Roedel <joro@8bytes.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v11 0/3] Enhance IOMMU default DMA mode build options
Message-ID: <YMB4tCrkZv1b44qM@8bytes.org>
References: <1623158308-180604-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623158308-180604-1-git-send-email-john.garry@huawei.com>
Cc: will@kernel.org, rdunlap@infradead.org, linuxarm@huawei.com,
 robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, dwmw2@infradead.org
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

Hi John,

On Tue, Jun 08, 2021 at 09:18:25PM +0800, John Garry wrote:
> Zhen Lei (3):
>   iommu: Enhance IOMMU default DMA mode build options
>   iommu/vt-d: Add support for IOMMU default DMA mode build options
>   iommu/amd: Add support for IOMMU default DMA mode build options

So I like the idea, but can we go a step further and get (mostly) rid of
the driver-specific setup code for lazy/non-lazy mode? This can happen
in the dma-iommu code and the drivers only need to keep the support for
their legacy command line options.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
