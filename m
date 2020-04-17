Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E902F1AD3F5
	for <lists.iommu@lfdr.de>; Fri, 17 Apr 2020 03:09:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E2E3186246;
	Fri, 17 Apr 2020 01:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id la3JySpAympf; Fri, 17 Apr 2020 01:09:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5FB9D85CF0;
	Fri, 17 Apr 2020 01:09:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A738C1AE8;
	Fri, 17 Apr 2020 01:09:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A6AFC0172
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 01:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 10C9920415
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 01:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVOw6xtnoGxV for <iommu@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 01:09:05 +0000 (UTC)
X-Greylist: delayed 00:05:21 by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id BF4CF20003
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 01:09:05 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g2so333110plo.3
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 18:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ZL5DKQEN5tIRYMA9bsAF7qYyxlNKGNuVSjiADQ9SPk=;
 b=FrdtkA3N/A0B10cQBR1BRxqf+/pg1uBkd6DO7lHtdKgOqGpk1/7USrxTk4rdlzJ0Pn
 oQGe7ba6HSEplsOy6ec3K4H8Fpx1j9/0meJ+gk7xvdUqFq7CDtsNxsMJzjX3kGdDbbz8
 GCSySEUU8oXzqHDM2sby4knjcPLSSaIgNvaO9PtWZWWefGILL8HPrNXdIlKHYq2YILWZ
 AMHiZb/IAXXMBCtRYZZ2S6R7t7InyUg113cLru837l9P5It247de3hDzpXYYYkdzsiNW
 l3eKB2Wxab5vn9CTNWz5BkklF52xIUVdN24g+AL8C9OhFHLjLh5Ls1ropaQnpLD31b3o
 DqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ZL5DKQEN5tIRYMA9bsAF7qYyxlNKGNuVSjiADQ9SPk=;
 b=m87aJkZAajV4zX39KMBXk6+M2N3uDiiMr8q0Rw1pHUZrpFDqBNotUn9aofZTbXwvtb
 OuDMUOWK9ZT0hqpXbb9Ptrikf8u2CmH2t6C/yRwM9ODNmAWxH8FG74l271c53mX+QCH/
 dk+b4hG9AfawbYpiTmTNJY0u8FMPGRRIN8ucDPhJTilDp0ah/n8KCnE9xGGlVLTddJFZ
 CXXV97edcNNlX8ySNFiL6wMcICO9uJWPxF5Q+cTBCjbZcs7QppGaNkfovfgSNerBb7ZP
 BB3jgMvJBmzq0EqCwR03RpM/Ou8KRmMONI+nIugP/g+yqRy7G5c+5wOrX94ggbgkqiL2
 h7FA==
X-Gm-Message-State: AGi0PuY4YvmfZgwYR6g0YtHrecqbc5XPmL7Ycii+31445Q2UoDn+ECZ6
 8UmHTktR9Ai516ZBBBPlmUUfTbJ54YwgTA==
X-Google-Smtp-Source: APiQypKfJXVVs8nt0ABNaLviRVVB2FF8oWh5BJ43V1JXuqqLWnC3nHs+J6exlmUfG8/Dws2LqNNTtg==
X-Received: by 2002:a17:902:fe09:: with SMTP id
 g9mr366208plj.171.1587085424144; 
 Thu, 16 Apr 2020 18:03:44 -0700 (PDT)
Received: from limbo.local (host-160.218-14-119.dynamic.totalbb.net.tw.
 [119.14.218.160])
 by smtp.gmail.com with ESMTPSA id u8sm16518026pgl.19.2020.04.16.18.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 18:03:43 -0700 (PDT)
From: Daniel Drake <drake@endlessm.com>
To: joro@8bytes.org
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Date: Fri, 17 Apr 2020 09:03:35 +0800
Message-Id: <20200417010335.31739-1-drake@endlessm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414131542.25608-1-joro@8bytes.org>
References: <20200414131542.25608-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: heiko@sntech.de, bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, will@kernel.org, jean-philippe@linaro.org,
 linux-samsung-soc@vger.kernel.org, krzk@kernel.org, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, agross@kernel.org,
 jonathan.derrick@intel.com, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, virtualization@lists.linux-foundation.org,
 gerald.schaefer@de.ibm.com, dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, kgene@kernel.org, robin.murphy@arm.com
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

Hi Joerg,

> Hi,
> 
> here is the second version of this patch-set. The first version with
> some more introductory text can be found here:
> 
> 	https://lore.kernel.org/lkml/20200407183742.4344-1-joro@8bytes.org/

Thanks for the continued improvements in this area!

I may have spotted a problem with setups like VMD.

The core PCI bus is set up during early boot.
Then, for the PCI bus, we reach iommu_bus_init() -> bus_iommu_probe().
In there, we call probe_iommu_group() -> dev_iommu_get() for each PCI
device, which allocates dev->iommu in each case. So far so good.

The problem is that this is the last time that we'll call dev_iommu_get().
If any PCI bus devices get added after this point, they do not get passed
to dev_iommu_get().

So when the vmd module gets loaded later, and creates more PCI devices,
we end up in iommu_bus_notifier() -> iommu_probe_device()
-> __iommu_probe_device() which does:

	dev->iommu->iommu_dev = iommu_dev;

dev->iommu-> is a NULL dereference because dev_iommu_get() was never
called for this new device.

Daniel

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
