Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C963A3C38
	for <lists.iommu@lfdr.de>; Fri, 11 Jun 2021 08:48:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23B6940697;
	Fri, 11 Jun 2021 06:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8a_ZfBNwx0f; Fri, 11 Jun 2021 06:48:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1886140695;
	Fri, 11 Jun 2021 06:48:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5AAAC000B;
	Fri, 11 Jun 2021 06:48:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B12CC000B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 06:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A5D183709
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 06:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTIT_QsrnXOn for <iommu@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 06:48:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7870F83641
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 06:48:05 +0000 (UTC)
Received: from mail-wm1-f69.google.com ([209.85.128.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lraxX-00019Y-Su
 for iommu@lists.linux-foundation.org; Fri, 11 Jun 2021 06:48:03 +0000
Received: by mail-wm1-f69.google.com with SMTP id
 z25-20020a1c4c190000b029019f15b0657dso4045418wmf.8
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 23:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g18pPDMlWCQw8P7WsPDKmd8BzlhyjHJ9IBbVaDXTjEY=;
 b=M1cNV1vJEnJMwm2ZQu1RDn5wbPggrb/c2ZDxG3iUjrA6UR0z265HMqFdeYG8tcnOFv
 DDw7lnKYX5mi1kwvWlVDXAxJtIj25NRw6oWkkfrW9FGGMIXcOiwYF9Rvfa+UAQNRZlxh
 BXypvBFjyERef1jVHj3TVvcV9r8d/oz5iPIBmNk3VQB8sGhW3ot9iKVPeiak0Rd4c0v8
 PlkhM0AbZi3hay7enDuLTlDyww+IZ5rLnPpWcxqTlxUwT9Ts71oIaFcvvwDJk00zYB48
 UOdLjeSOzDmeX0q3giA7gCkbHMl9fY7fYZ7zqAbjrVkPtHX52vsUq97M2RUecaBE7apG
 sJrQ==
X-Gm-Message-State: AOAM533sgS9p+1iYGQgRgtKaRM9RC2LKF0IFSsKM7FHZ4+F+kB0mS6dJ
 3wPO4VLK3ZTESOkfTjK1Yi7COlS0rv5mkjVrSkcA+UZBivCNC/38EDueAr9pO6ifzqeY0uxKYOe
 fU5pMgKmIeMwf1lSdWpP0kSrfbzBWtoq7E40wiSLdX8AM/EY=
X-Received: by 2002:a05:6000:1847:: with SMTP id
 c7mr2208574wri.368.1623394083492; 
 Thu, 10 Jun 2021 23:48:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynbbdfGvQvWU48UUaPoxeMsAdxllaSjaX19MR91AuSg2c9vxcmsbkavMKDfKV0VyN9nT+STg==
X-Received: by 2002:a05:6000:1847:: with SMTP id
 c7mr2208555wri.368.1623394083319; 
 Thu, 10 Jun 2021 23:48:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id l13sm6221631wrz.34.2021.06.10.23.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 23:48:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Will Deacon <will@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/9] arm64: tegra: Prevent early SMMU faults
Date: Fri, 11 Jun 2021 08:48:00 +0200
Message-Id: <162339404910.6729.11145661496228624827.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 iommu@lists.linux-foundation.org, Jon Hunter <jonathanh@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, linux-tegra@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Thu, 3 Jun 2021 18:46:23 +0200, Thierry Reding wrote:
> this is a set of patches that is the result of earlier discussions
> regarding early identity mappings that are needed to avoid SMMU faults
> during early boot.
> 
> The goal here is to avoid early identity mappings altogether and instead
> postpone the need for the identity mappings to when devices are attached
> to the SMMU. This works by making the SMMU driver coordinate with the
> memory controller driver on when to start enforcing SMMU translations.
> This makes Tegra behave in a more standard way and pushes the code to
> deal with the Tegra-specific programming into the NVIDIA SMMU
> implementation.
> 
> [...]

Applied, thanks!

[1/9] memory: tegra: Implement SID override programming
      (no commit info)
[2/9] dt-bindings: arm-smmu: Add Tegra186 compatible string
      commit: 4287861dca9d77490ee50de42aa3ada92da86c9d

[3/9] - skipped

[4/9] iommu/arm-smmu: tegra: Detect number of instances at runtime
      commit: 7ecbf253f8d64c08de28d16a66e3abbe873f6c9f
[5/9] iommu/arm-smmu: tegra: Implement SID override programming
      commit: 8eb68595475ac5fcaaa3718a173283df48cb4ef1
[6/9] iommu/arm-smmu: Use Tegra implementation on Tegra186
      commit: 2c1bc371268862a991a6498e1dddc8971b9076b8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
