Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C07298F7E
	for <lists.iommu@lfdr.de>; Mon, 26 Oct 2020 15:38:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3731A85FC1;
	Mon, 26 Oct 2020 14:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hzpSeV9nRxRT; Mon, 26 Oct 2020 14:38:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E4CA85FB4;
	Mon, 26 Oct 2020 14:38:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2599FC0051;
	Mon, 26 Oct 2020 14:38:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53F44C0051
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 14:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4ED312E10B
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 14:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70Gt2hHTMm+X for <iommu@lists.linux-foundation.org>;
 Mon, 26 Oct 2020 14:38:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by silver.osuosl.org (Postfix) with ESMTPS id C8BA620494
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 14:38:03 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id b2so7607638ots.5
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 07:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dmc6xs39pOcvaguHHkLHxd4UeG9+n4WiLiCISEFRVvE=;
 b=r8i2EIdFRvFxtak/UVrU9tCIoTKXqH9BCOcp0PsaCGjrMKb2ecjx2Boyge/cz+SRnm
 yYFcDJjbHPwKauTgDtO9SPWuK6bA3f8FXidOXZY0G59xTIm9+262jVErcLb3OoAx+App
 wDpm190RiE5/5tey27X0Uuv7Ie3luQUnTnRnfTlTiu3wHOZ1FPU4D4ZvjpZwaGrJ3sGG
 qDWyD6svuEEZfvygXLVCcEthpYRwg94DDQsPchgmiwF2WWU8Fd0/+qm9gJgCNlLJsznA
 o4wZ5ZC46jq/6eEq/HQzN/SR73qleywur1evZGxbcFDLIzWAU4XYfJ40F8tQw9FF2UF9
 Dp9Q==
X-Gm-Message-State: AOAM530HXOy4wWu2lBru1F6fkFoSHoMBv22svtt0JNyimz2NbScHZHD8
 AST4Raj5Bxq2JU95ougX1g==
X-Google-Smtp-Source: ABdhPJxI/8VTP5i/7wxqiKj0bWHUYN05SkqR0BiJs/0nllrZpJVEWuPVO0ce25saT4lDP9QNHLdr9Q==
X-Received: by 2002:a9d:411:: with SMTP id 17mr14374161otc.191.1603723083071; 
 Mon, 26 Oct 2020 07:38:03 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u22sm4032299oor.13.2020.10.26.07.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:38:01 -0700 (PDT)
Received: (nullmailer pid 123037 invoked by uid 1000);
 Mon, 26 Oct 2020 14:38:01 -0000
Date: Mon, 26 Oct 2020 09:38:01 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v4 4/7] of: unittest: Add test for
 of_dma_get_max_cpu_address()
Message-ID: <20201026143801.GA122988@bogus>
References: <20201021123437.21538-1-nsaenzjulienne@suse.de>
 <20201021123437.21538-5-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021123437.21538-5-nsaenzjulienne@suse.de>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 ardb@kernel.org, iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, guohanjun@huawei.com, will@kernel.org,
 hch@lst.de, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
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

On Wed, 21 Oct 2020 14:34:34 +0200, Nicolas Saenz Julienne wrote:
> Introduce a test for of_dma_get_max_cup_address(), it uses the same DT
> data as the rest of dma-ranges unit tests.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> 
> ---
> Changes since v3:
>  - Remove HAS_DMA guards
> 
>  drivers/of/unittest.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
