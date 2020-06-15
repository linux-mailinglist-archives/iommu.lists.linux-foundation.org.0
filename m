Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FEC1F9500
	for <lists.iommu@lfdr.de>; Mon, 15 Jun 2020 13:06:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C02988438;
	Mon, 15 Jun 2020 11:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-t7wOlgjtOe; Mon, 15 Jun 2020 11:06:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5BA2488489;
	Mon, 15 Jun 2020 11:06:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 475BAC016E;
	Mon, 15 Jun 2020 11:06:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08DE6C016E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 03:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E519988314
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 03:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1VIhbQA3Tjz for <iommu@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 03:47:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6CFB387DB7
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 03:47:04 +0000 (UTC)
Received: from mail-ot1-f69.google.com ([209.85.210.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1jkg5O-0004u6-On
 for iommu@lists.linux-foundation.org; Mon, 15 Jun 2020 03:47:02 +0000
Received: by mail-ot1-f69.google.com with SMTP id s62so7721941otb.10
 for <iommu@lists.linux-foundation.org>; Sun, 14 Jun 2020 20:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=gLj1m6P/PsBOj+/yO4bax2TzGsrqf3sQFXrDZYfsUSU=;
 b=ozV9l3gPWR3aJYp3TIJ97TSQKDeBKR+Dku9uNOraha5yU5aIFjzO2NtdtCim4RvQjX
 Lbmob4S839EBgpRaqcuQyha3iL/yPSrUD8ZXtsRZFevEDWRZhAzhdqyKLuSHsInRbvtn
 BrS2j+lOK3mblJNJUWa+e/cnXowvGrOEhiYCy9j6q8o4nWwXJQ9yWFGRQUnprWHAZfjm
 BqsSn8yBPx2DFIdqoi4m2Ia0PlZ9DC61EMwK+Pf/b23lLlxs84DPdSQC8oOxEhR54uwf
 V8ZZNiaMU/Ker6Awm3+Ekn5Hwbj3wfjV3Rbrt7EfWw0UF48ELb4toa7r/i9U7BWR2Fyi
 II/g==
X-Gm-Message-State: AOAM530zdJAGsivQDe40lX5ojQK4WzUzdzWxATPNj0hdfbZQfAk9BGvy
 ebo+rQymXehqhbv65S/MBBuYNt8kv4udZM1/NaVkeb3hYVNmtlg4kPUzLDgqioUfaAPD2r8xf0M
 jhldCoa+/89JHLmXxuu5bqRjM20Nxq8YRJc2lVc5fNRKIv4biAlEVWrtZxN9vi9U=
X-Received: by 2002:aca:4dc3:: with SMTP id a186mr7707138oib.17.1592192821768; 
 Sun, 14 Jun 2020 20:47:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1eA2syoGY3ouBbg27yDaHoLb0qZMhWd1yZDnOXkdZehKjxXYqlXFUvzm7HmbNlQZfkgvjNqKaQWVhUIHQOZw=
X-Received: by 2002:aca:4dc3:: with SMTP id a186mr7707130oib.17.1592192821489; 
 Sun, 14 Jun 2020 20:47:01 -0700 (PDT)
MIME-Version: 1.0
From: Koba Ko <koba.ko@canonical.com>
Date: Mon, 15 Jun 2020 11:46:50 +0800
Message-ID: <CAJB-X+VcHvYWngtMVHw5f_XaqA4i4T61yt=h7YvuD=eo3y7Rog@mail.gmail.com>
Subject: [Issue]platform/x86: iommu: System can't shutdown because iommu
 driver keeps checking the status of DMA_GSTS_TES
To: David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>
X-Mailman-Approved-At: Mon, 15 Jun 2020 11:06:21 +0000
Cc: iommu@lists.linux-foundation.org,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

hi All,
I have a machine and there's only intel gpu.
the secureboot and vt-d is enabled in BIOS.
On the Ubuntu desktop, I do s2idle first and restart the machine.
The machine can't restart successfully, so I need to press the power
button to shutdown.
I tried  each of the following and the issue can't be triggered.
1. disable secure boot in BIOS.
2. intel_iommu=off.
3. intel_iomm=igfx_off.
4. nomodeset
5. i915.modeset=0.

After I investigate further, find inte_iommu keeps checking the status
of DMA_GSTS_TES.
During the procedure of restart, the driver would disable iommu translation and
check the status of DMA_GSTS_TES until status of DMA_GSTS_TES is 0.

If you need more information, I can provide it.

Thanks
Koba Ko
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
