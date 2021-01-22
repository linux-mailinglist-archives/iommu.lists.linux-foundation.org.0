Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B06FC3006D6
	for <lists.iommu@lfdr.de>; Fri, 22 Jan 2021 16:15:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E21E86EAF;
	Fri, 22 Jan 2021 15:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G+Y2Ku6R08UE; Fri, 22 Jan 2021 15:15:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ABA0286EA7;
	Fri, 22 Jan 2021 15:15:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91178C013A;
	Fri, 22 Jan 2021 15:15:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53CC3C013A
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 15:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 42081872F2
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 15:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vq+Rwy6X9qKz for <iommu@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 15:15:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 52AC3872E4
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 15:15:11 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id c12so5422390wrc.7
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 07:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=69jBLNDQCDih7BbYaZQUyDgS1+kzJvyef3wrHErr4Jo=;
 b=zyIFN2OmMm+dEmbCYUY1wq7s6Zy/8eC9VnEqnPUz+6uGZZu7NM/axQ7coBt5inaDy7
 dSHnUmoqK2Aqp1tNsEc003zvLiCjNRpXYPeNB9lvB6ZPxsYta545PQIUHLxFjTulB3jQ
 o8ExiyiQ/rqnjmNzfEe1XLpq/eb2OaGnEYxld55zGVigINDXERH6fSNLYdDcgWjzZTzn
 JP7mPKli961WTJhX/s5NpfvadZOx78BOhVljnyU9TiD8J0VXt4P4cy7tj72gcG2DIMhf
 bPwuuezkPDOnqHc9ToBcd8y/cTYJlvrrAayVzoff2H6j3hEAMPt69kWQ+bZkddJ+LzbS
 v7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=69jBLNDQCDih7BbYaZQUyDgS1+kzJvyef3wrHErr4Jo=;
 b=K4zDNILE2vbHMNMUoKmZvxSnNP4LPTMgAmkn/66atrQFxhwGamgk+l1seE6d0AddV4
 zrq6oXaCjMLbP2tWuslXIWwD9m1iMduPdqMbnE817sTTWPSSEwR62D9mtcN19DXGScTc
 kXpdttBBbHTkkG6ggP0aRw/mW2unDmFzAIrkal2uPkaPFfBnx7GefQPZSopMTawwNiVL
 Vwr2BJn02LvYm1V1vPQ6F8nKGp+OmwT2yA6UZWgzhsFW6ipxJ9hvPFIJlrbtiZhSMP37
 +iFHV9nFeVmsaV34lHfIz28hHpK7SxH9kjy7ZaZJuil5DXwjryitEQaSg7n2aKc8eDTG
 lJuw==
X-Gm-Message-State: AOAM531cKElwPOFlWkwx73ng5rUDyTE/5n/i9iCv9WAOp4zJfA2SPrLH
 VdXO16sw3Z8IxvDF7+CkumJxvw==
X-Google-Smtp-Source: ABdhPJwESn3gG+jfg7U/Om8rYxxXFwuePy1Y1K0jVZLgP2kh/U4ERKodFo7adoXxRPaMyBD8jtgwcw==
X-Received: by 2002:adf:fa02:: with SMTP id m2mr4883994wrr.130.1611328509895; 
 Fri, 22 Jan 2021 07:15:09 -0800 (PST)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id h1sm9001945wrr.73.2021.01.22.07.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 07:15:09 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org
Subject: [PATCH v2 0/3] iommu/arm-smmu-v3: TLB invalidation for SVA
Date: Fri, 22 Jan 2021 16:10:53 +0100
Message-Id: <20210122151054.2833521-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, vivek.gautam@arm.com,
 iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
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

Since v1 [1]
* Renamed arm_smmu_tlb_inv_range()
* Removed unnecessary tlb_inv_command variable
* Rebased onto for-joerg/arm-smmu/updates (oddly I didn't get any
  conflict, I hope it will apply this time)

[1] https://lore.kernel.org/linux-iommu/20210122115257.2502526-1-jean-philippe@linaro.org/

Jean-Philippe Brucker (3):
  iommu/arm-smmu-v3: Split arm_smmu_tlb_inv_range()
  iommu/arm-smmu-v3: Make BTM optional for SVA
  iommu/arm-smmu-v3: Add support for VHE

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   6 +
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  10 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 106 ++++++++++++------
 3 files changed, 87 insertions(+), 35 deletions(-)

-- 
2.30.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
