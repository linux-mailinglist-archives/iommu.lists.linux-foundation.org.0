Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1EC517555
	for <lists.iommu@lfdr.de>; Mon,  2 May 2022 19:04:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A185A60F08;
	Mon,  2 May 2022 17:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3SlBodJ0WYF; Mon,  2 May 2022 17:04:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BB4A960F47;
	Mon,  2 May 2022 17:04:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67BDEC007E;
	Mon,  2 May 2022 17:04:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BCA8C002D
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 17:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6E2E40A83
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 17:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fc6-AcsaE__h for <iommu@lists.linux-foundation.org>;
 Mon,  2 May 2022 17:04:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B7FB4064D
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 17:04:30 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so14824329fac.7
 for <iommu@lists.linux-foundation.org>; Mon, 02 May 2022 10:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sZqvkkRDCdorFRZtCcuZ+8QHBB5xU6cFlN1q+kyC+GU=;
 b=GGHYsPZhjgYutFAgnUUjRqsqsQTYsZspP3TWE22puTbkZFsePCeJe/Iajp3MJKq9EE
 LG3cjWaGJY/jsi39x7mFu3j38bcAI2QZePZLUSIzjKkTSLmJR0MxfzMsmq2Oa3PBzthP
 pUdt1neEmShqk2Rb+iJucKY3qUI/7gcfp+hCf2XjRw1DBqu1Au+Xb6NEN3cp3nK0tjvU
 vAjELll/4b6SfaeeadPfbmsQcMG18q5MsZ0SwIbq41msvNtKiXV2eugs0dpyAsfjivO0
 cqvOdVjQCJ7RF2YjDqAPRpYGOQPzFgBh7ZvEXYChAo6jZTt91QxedSrB8gfsWmAb9rdZ
 bAhw==
X-Gm-Message-State: AOAM531BZHhoTk5SsrDEnTEB9/HpuY41ryH0MaqbKw0epCvIJRGiD4hN
 wV/xZex/vMbtY38aiSjQtQ==
X-Google-Smtp-Source: ABdhPJw4D0yfe3Fz0McLxXba8QUskqPgAj+qjdP3d+lHF74ObtMt4NNeJRgeQ9fSvANifBABZ4ZBiA==
X-Received: by 2002:a05:6870:4201:b0:e6:47c4:e104 with SMTP id
 u1-20020a056870420100b000e647c4e104mr32155oac.257.1651511069314; 
 Mon, 02 May 2022 10:04:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m4-20020a056870194400b000e686d13883sm6038754oak.29.2022.05.02.10.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 10:04:28 -0700 (PDT)
Received: (nullmailer pid 1339087 invoked by uid 1000);
 Mon, 02 May 2022 17:04:27 -0000
Date: Mon, 2 May 2022 12:04:27 -0500
From: Rob Herring <robh@kernel.org>
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: Re: [PATCH 1/4] dt-bindings: mmc: sdhci-msm: Document the SDX65
 compatible
Message-ID: <YnAPGwCHA66V6+NW@robh.at.kernel.org>
References: <1651480665-14978-1-git-send-email-quic_rohiagar@quicinc.com>
 <1651480665-14978-2-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1651480665-14978-2-git-send-email-quic_rohiagar@quicinc.com>
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 bhupesh.sharma@linaro.org, will@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 adrian.hunter@intel.com, iommu@lists.linux-foundation.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robin.murphy@arm.com,
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

On Mon, 02 May 2022 14:07:42 +0530, Rohit Agarwal wrote:
> The SDHCI controller on SDX65 is based on MSM SDHCI v5 IP. Hence,
> document the compatible with "qcom,sdhci-msm-v5" as the fallback.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
