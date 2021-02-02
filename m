Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F6030C084
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 15:01:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E916B867C6;
	Tue,  2 Feb 2021 14:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B+vbxj3Usn3p; Tue,  2 Feb 2021 14:01:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4499C867D2;
	Tue,  2 Feb 2021 14:01:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2962EC013A;
	Tue,  2 Feb 2021 14:01:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B00EDC013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 14:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A15FD85A82
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 14:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLLUUFWWaa_7 for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 14:01:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2086485A49
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 14:01:04 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AF3843D4; Tue,  2 Feb 2021 15:01:02 +0100 (CET)
Date: Tue, 2 Feb 2021 15:01:01 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH 2/2] iommu: add Unisoc iommu basic driver
Message-ID: <20210202140101.GA32671@8bytes.org>
References: <20210202073258.559443-3-zhang.lyra@gmail.com>
 <20210202104257.736836-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202104257.736836-1-zhang.lyra@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunyan Zhang <chunyan.zhang@unisoc.com>, Sheng Xu <sheng.xu@unisoc.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
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

On Tue, Feb 02, 2021 at 06:42:57PM +0800, Chunyan Zhang wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> This iommu module can be used by Unisoc's multimedia devices, such as
> display, Image codec(jpeg) and a few signal processors, including
> VSP(video), GSP(graphic), ISP(image), and CPP(camera pixel processor), etc.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
>  drivers/iommu/Kconfig      |  12 +
>  drivers/iommu/Makefile     |   1 +
>  drivers/iommu/sprd-iommu.c | 598 +++++++++++++++++++++++++++++++++++++

This looks like it actually belongs under drivers/iommu/arm/, no?

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
