Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A3154E8CD
	for <lists.iommu@lfdr.de>; Thu, 16 Jun 2022 19:48:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57DD141BE1;
	Thu, 16 Jun 2022 17:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJhI9iqw-a_F; Thu, 16 Jun 2022 17:48:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4CC3E41BD8;
	Thu, 16 Jun 2022 17:48:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 144B9C002D;
	Thu, 16 Jun 2022 17:48:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 047B9C002D
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 17:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E06DC41BE3
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 17:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7XoU7wb65KXU for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 17:48:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA99741BD8
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 17:48:28 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id a10so2217527ioe.9
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 10:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8PRZvVfxrwvO+Gtg+me/nbumG0ROGVptfpPPQu8bk/g=;
 b=yFF0fsUaY0HTKGeSkgsQMAeZYmQvIo/SIMgUt7tCDu6/xlyfz62L3A6vqVU4WBGvUa
 +CK6ij5+qKnSdzaHzAMoWwLBLU3GGPShbal9hFJQw/9kk2FDdoqYxby6b+0MMXWd9jur
 Vf2z9jQNJEFvWu3MyYyssxl3+gCgiCeQSvryq5iP14MlCD+FBn5GHxkQ5zDTrPW8vE76
 hO9rUxG7Wgpuqmn77Bn4MTMOwmsDL8VhkyDBkT+Hybxtz/KotXtsEGo64FkCPtSXcIz5
 Sm9g0UOrnjWWsWtloivNEgVQzEJ0llUW35f+XUTcAyU0O6eubVY4p0GIyHpKBFE5Hw/H
 ar8g==
X-Gm-Message-State: AJIora/W4qIhUcilpp4FlVdAZl7uPisHvEhwHe4akidjf/0PSLRQJam1
 pzwBTjN5mMRtV9D5NhwPVg==
X-Google-Smtp-Source: AGRyM1uStzsNCcUCj1nK3GKFUp81TU3fcKgTNQUHLYhagMD1LobI/qIqbi5gYRYzXNdJb3ar1mUyPQ==
X-Received: by 2002:a05:6602:2d44:b0:669:ef11:523a with SMTP id
 d4-20020a0566022d4400b00669ef11523amr3141947iow.44.1655401707803; 
 Thu, 16 Jun 2022 10:48:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a927d01000000b002d3aff5d8b0sm1250089ilc.14.2022.06.16.10.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 10:48:27 -0700 (PDT)
Received: (nullmailer pid 3710861 invoked by uid 1000);
 Thu, 16 Jun 2022 17:48:25 -0000
Date: Thu, 16 Jun 2022 11:48:25 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH v2 1/4] dt-bindings: qcom-iommu: Add Qualcomm MSM8953
 compatible
Message-ID: <20220616174825.GA3710771-robh@kernel.org>
References: <20220612092218.424809-1-luca@z3ntu.xyz>
 <20220612092218.424809-2-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220612092218.424809-2-luca@z3ntu.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Will Deacon <will@kernel.org>
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

On Sun, 12 Jun 2022 11:22:13 +0200, Luca Weiss wrote:
> Document the compatible used for IOMMU on the msm8953 SoC.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes from v1:
> - new patch
> 
>  Documentation/devicetree/bindings/iommu/qcom,iommu.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
