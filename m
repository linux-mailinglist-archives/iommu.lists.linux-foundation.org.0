Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9B04FDEBA
	for <lists.iommu@lfdr.de>; Tue, 12 Apr 2022 13:56:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54E6A40A06;
	Tue, 12 Apr 2022 11:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3afDMhbOR43t; Tue, 12 Apr 2022 11:56:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 34A52410A5;
	Tue, 12 Apr 2022 11:56:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B9DBC0089;
	Tue, 12 Apr 2022 11:56:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0713C002C
 for <iommu@lists.linux-foundation.org>; Tue, 12 Apr 2022 11:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEC9360F6B
 for <iommu@lists.linux-foundation.org>; Tue, 12 Apr 2022 11:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vMo6ncfUXe7P for <iommu@lists.linux-foundation.org>;
 Tue, 12 Apr 2022 11:54:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3445260E61
 for <iommu@lists.linux-foundation.org>; Tue, 12 Apr 2022 11:54:56 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id s18so14363666ejr.0
 for <iommu@lists.linux-foundation.org>; Tue, 12 Apr 2022 04:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QHCIwf7uKojCa/2Ev85bnweKYQuMU3PscULOv/3SfH0=;
 b=DD4J/SiIfk70HC7aXDM4XEePvBUKdzzefIcgqBNThjAReDiodJEUxv0NPXpUdN4Kvw
 5GK38QtWhkafFiYN5PdU1rjp9aro7+WtQivpUph3krYiRej9dnybekWAPqZ7OAw9F8xL
 wNK5tQg9jnGDORnDvGQ8VgkSLX5FYQOqHwx3FAh9Ov0huiJqoLlT2vuI0KfWGVYBqxCW
 2IWQ1R+ATurd2bGH5iYdmSLgRVFDArfFNifG/UnU14tH8thrH521ohSzxTH0Mb70XYmd
 T8f7UVwyAEgO4OGSy7qDzscYWwIkGggVShOv5zJcBZ/+SU6h/uZEvJujeGPcbML/6rfT
 H1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QHCIwf7uKojCa/2Ev85bnweKYQuMU3PscULOv/3SfH0=;
 b=nBEsaAW7CngwQ+rqO4YjRSsMb0sGL5ZVBwLUIRwA/W9U/wJXa5d7tffnwmKqM7jlbL
 aLG9v8vgksf/bqo0uM5ihXxpWNOHTXotypHONjB/y6vInnCNlOJyjwDyuXHJ2wB1KnIn
 0M9n+NNeyAkUaMTWRk0IXYIscm8gW9Nv0dkPOdlybiUDoKO7KATACAyBJmLeGf20kGgK
 R1f075yFnZQX1A1v9wjXZw+Ffl/WHV1lZYsKceApn02chiE11ZCLXyvgITDO3bIZsJzf
 QLUaU3Wk94nlEhGInWX1p2I9ZbhjE1yQdbkoIfUYphUGgvGQjTj+c3ClK/gFMeU4J5JC
 4jBQ==
X-Gm-Message-State: AOAM5316vnbSI3ONHYegWwOfTV7WlleWUQUIpn5sX7O/rVHm4vVnTmUY
 pK3bmf2G6SMaOB7Z1qAx7RDEBQ==
X-Google-Smtp-Source: ABdhPJx9FE2flpben9B2OZUqjC1Vqv352+dinvZFdVtXqGLSmXzCHwsuwcdIhzcf0QGCra4M1rTYbQ==
X-Received: by 2002:a17:906:e87:b0:6df:8602:5801 with SMTP id
 p7-20020a1709060e8700b006df86025801mr34857117ejf.140.1649764494490; 
 Tue, 12 Apr 2022 04:54:54 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 g4-20020a17090613c400b006e843330364sm5568236ejc.122.2022.04.12.04.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 04:54:54 -0700 (PDT)
Message-ID: <2f0ecdb6-97f0-213a-7ee7-d1fe0a7406a8@linaro.org>
Date: Tue, 12 Apr 2022 13:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/7] dt-bindings: mmc: sdhci-msm: Document the SDX65
 compatible
Content-Language: en-US
To: Rohit Agarwal <quic_rohiagar@quicinc.com>, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, ulf.hansson@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1649670615-21268-1-git-send-email-quic_rohiagar@quicinc.com>
 <1649670615-21268-3-git-send-email-quic_rohiagar@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1649670615-21268-3-git-send-email-quic_rohiagar@quicinc.com>
X-Mailman-Approved-At: Tue, 12 Apr 2022 11:56:46 +0000
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, manivannan.sadhasivam@linaro.org,
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

On 11/04/2022 11:50, Rohit Agarwal wrote:
> The SDHCI controller on SDX65 is based on MSM SDHCI v5 IP. Hence,
> document the compatible with "qcom,sdhci-msm-v5" as the fallback.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
