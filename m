Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB40376B19
	for <lists.iommu@lfdr.de>; Fri,  7 May 2021 22:15:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02E61403AC;
	Fri,  7 May 2021 20:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PX8x15tLgV1J; Fri,  7 May 2021 20:15:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E85440218;
	Fri,  7 May 2021 20:15:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 039BAC0001;
	Fri,  7 May 2021 20:15:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48C59C0001
 for <iommu@lists.linux-foundation.org>; Fri,  7 May 2021 20:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EA6160689
 for <iommu@lists.linux-foundation.org>; Fri,  7 May 2021 20:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOOlSNo6wObk for <iommu@lists.linux-foundation.org>;
 Fri,  7 May 2021 20:15:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBEE560687
 for <iommu@lists.linux-foundation.org>; Fri,  7 May 2021 20:15:14 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so2639655oth.8
 for <iommu@lists.linux-foundation.org>; Fri, 07 May 2021 13:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7l4JEUMp2ZnRM1Fn/oKHA3iE5U9Bk3RHSfWh0z09m4g=;
 b=YYsrPgpx1gOpsigeOn2y91UVReAAgmiMt9HuOdVKaY8//hR4SDiZB6aWUv1h30d2ZK
 P8MFaCCBQ30qByplq/f4Sn4A5ghxdJnU2bmHGhpmpoC5D1xpPbe3BNvIvZAfacy/u8a9
 XXtnhgBmlxe01I8azGdsBiorQkIkL2j1uvMh2tlj6qD8y8PvXsOZgIjf91d61G+CAaTy
 e92BElZlT+V7+HyIMep9z9rn5z2oVxEhs5YYxnrX2gote0VPftI2MJSC+aa790/wj/UY
 B2xJIR6P1wdRrBelKzTKdmr9V5kdSBnYicTtTzv/54RAtp/dP4PIJ9MPFILldyDQP0wy
 Hf3A==
X-Gm-Message-State: AOAM5312wazxcbA3ZOikX5I5hEduC4Z8aziyv19pGh626N8PBbULH34v
 02CmHT511LSkWJ0q+8ShSQ==
X-Google-Smtp-Source: ABdhPJwZzmjv8nbBXzcXjgH90d5sMNPJTOhPzToTWSST5h3nq6f1xTuf4EGckNuXIFBESPM0VULEFw==
X-Received: by 2002:a9d:58c5:: with SMTP id s5mr9978209oth.243.1620418513731; 
 Fri, 07 May 2021 13:15:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a23sm1413738otf.47.2021.05.07.13.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 13:15:13 -0700 (PDT)
Received: (nullmailer pid 2805625 invoked by uid 1000);
 Fri, 07 May 2021 20:15:12 -0000
Date: Fri, 7 May 2021 15:15:12 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: iommu: rockchip: Convert IOMMU to DT
 schema
Message-ID: <20210507201512.GA2805596@robh.at.kernel.org>
References: <20210507090232.233049-1-benjamin.gaignard@collabora.com>
 <20210507090232.233049-2-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210507090232.233049-2-benjamin.gaignard@collabora.com>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, kernel@collabora.com, will@kernel.org,
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

On Fri, 07 May 2021 11:02:27 +0200, Benjamin Gaignard wrote:
> Convert Rockchip IOMMU to DT schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 4:
>  - Add descriptions for reg items
>  - Add description for interrupts items
>  - Remove useless interrupt-names proporties
> 
> version 2:
>  - Change maintainer
>  - Change reg maxItems
>  - Change interrupt maxItems
>  .../bindings/iommu/rockchip,iommu.txt         | 38 ---------
>  .../bindings/iommu/rockchip,iommu.yaml        | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iommu/rockchip,iommu.txt
>  create mode 100644 Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
