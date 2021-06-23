Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 513613B1390
	for <lists.iommu@lfdr.de>; Wed, 23 Jun 2021 07:56:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C089D605EC;
	Wed, 23 Jun 2021 05:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqivh7Pdxvov; Wed, 23 Jun 2021 05:56:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F085060694;
	Wed, 23 Jun 2021 05:56:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0DB8C001D;
	Wed, 23 Jun 2021 05:56:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 970FFC000E
 for <iommu@lists.linux-foundation.org>; Wed, 23 Jun 2021 05:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E4E08268F
 for <iommu@lists.linux-foundation.org>; Wed, 23 Jun 2021 05:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kt4lrt8vymv for <iommu@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 05:56:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEA938267F
 for <iommu@lists.linux-foundation.org>; Wed, 23 Jun 2021 05:56:43 +0000 (UTC)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lvvsP-0002Gx-En
 for iommu@lists.linux-foundation.org; Wed, 23 Jun 2021 05:56:41 +0000
Received: by mail-wm1-f72.google.com with SMTP id
 j18-20020a05600c1c12b02901dce930b374so156928wms.2
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 22:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y1jDlUMkwrAiNSpYqmp6DTWEmsBUMLxkuAWlef8a84E=;
 b=WqWaEuAaARdKieN0L6Mjwao1kKjCLfOWXQYIEtIQgaw89hDsDwsbNAqV8sarkdvFGO
 sQzYkqgOXdr/E/qY5T/QiWKlLCS4tFIJCDg0H2Tb0XkAgpqWZTahO9sNtxBaKzA2Oa6X
 SYtAE9rw7xDLMOZObBDsSzGX6JacnAVArLbtA016jdy5/GsXN5x6tgelFpUnseoNKlgk
 4qLifdmPiP6oHDN5FIhMmEervsrgXcrewIpE3rQoaVZ1vQNvzBhuGGh8SXbQyeC0MvF/
 aveaiLZoqqMFAUI/GBXOUgBc38PjpEWz2VfCA6E8tKbi3sd3OLhw5VvMIAB3ebqwV9TT
 uB8A==
X-Gm-Message-State: AOAM532KHxuGEJdyAqlhNQ61/IM/HsXXTq85RskDI0CwUmQosQkPwJOL
 7amgD76Wiy7GlrExxjb2GZ2cgO4F0Zodr9+EX1ftPZ4zzOzGXGleGijjL1otswV+BdWZar8QW+H
 riyd97rrEqgTkCMeU9w8iiganB/wl19jQFbh92J+tuCxw5/0=
X-Received: by 2002:a05:600c:2e53:: with SMTP id
 q19mr8945296wmf.39.1624427801155; 
 Tue, 22 Jun 2021 22:56:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyze8HeAsFtSsdRC1iygn/4uNoruW16F+7eeE14pFIaQkDBttwj9NY01uUA8WINYMF7R2Dr4w==
X-Received: by 2002:a05:600c:2e53:: with SMTP id
 q19mr8945284wmf.39.1624427801039; 
 Tue, 22 Jun 2021 22:56:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id r3sm4301005wmq.8.2021.06.22.22.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 22:56:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: arm-smmu: Fix json-schema syntax
Date: Wed, 23 Jun 2021 07:56:37 +0200
Message-Id: <162442779339.5511.14827117243689906234.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210621140036.2879563-1-thierry.reding@gmail.com>
References: <20210621140036.2879563-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>
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

On Mon, 21 Jun 2021 16:00:36 +0200, Thierry Reding wrote:
> Commit 4287861dca9d ("dt-bindings: arm-smmu: Add Tegra186 compatible
> string") introduced a jsonschema syntax error as a result of a rebase
> gone wrong. Fix it.

Applied, thanks!

[1/1] dt-bindings: arm-smmu: Fix json-schema syntax
      commit: bf3ec9deaa33889630722c47f7bb86ba58872ea7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
