Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A607A3EBF72
	for <lists.iommu@lfdr.de>; Sat, 14 Aug 2021 03:57:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6825380F15;
	Sat, 14 Aug 2021 01:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f07j67o68UzS; Sat, 14 Aug 2021 01:57:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4E33980EE7;
	Sat, 14 Aug 2021 01:57:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16A0DC001F;
	Sat, 14 Aug 2021 01:57:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABC48C000E
 for <iommu@lists.linux-foundation.org>; Sat, 14 Aug 2021 01:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with UTF8SMTP id 88E2E60662
 for <iommu@lists.linux-foundation.org>; Sat, 14 Aug 2021 01:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id BeGoCphzUdTP for <iommu@lists.linux-foundation.org>;
 Sat, 14 Aug 2021 01:57:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp3.osuosl.org (Postfix) with UTF8SMTPS id EF5106063C
 for <iommu@lists.linux-foundation.org>; Sat, 14 Aug 2021 01:57:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628906263; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Reply-To: Sender;
 bh=C+qezgIh0rDWivT4rvbZT5YmyvAyYRUfpE+phtBAAaw=;
 b=MMuTbGNQbe+e0avJ63I094Au9wy28icDWbv8p5KHniIPyxpOvht6d3cFodHwr7wvcYqsfvdn
 tymdQ5mlbEUMiuHSlv4hlxQivZ7zXLEJjJPNip7IZYi5566wogjC/nCp2f86colkPJR394S1
 MyxdfOJGdhHAcdJEm0qKZjczdP4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 611722f9b14e7e2ecbb6b8f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 14 Aug 2021 01:57:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EE11BC43460; Sat, 14 Aug 2021 01:57:12 +0000 (UTC)
Received: from BCAIN (104-54-226-75.lightspeed.austtx.sbcglobal.net
 [104.54.226.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bcain)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9AF9DC433F1;
 Sat, 14 Aug 2021 01:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9AF9DC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=bcain@codeaurora.org
From: "Brian Cain" <bcain@codeaurora.org>
To: "'Christoph Hellwig'" <hch@lst.de>, <iommu@lists.linux-foundation.org>,
 "'Russell King'" <linux@armlinux.org.uk>
References: <20210712061704.4162464-1-hch@lst.de>
 <20210712061704.4162464-8-hch@lst.de>
In-Reply-To: <20210712061704.4162464-8-hch@lst.de>
Subject: RE: [PATCH 7/7] hexagon: use the generic global coherent pool
Date: Fri, 13 Aug 2021 20:57:06 -0500
Message-ID: <00a901d790af$b05165c0$10f43140$@codeaurora.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQGLBLs9KUWyWP2l5ibPYuIecai1XAJ58qmhq/eGB5A=
Cc: 'Vladimir Murzin' <vladimir.murzin@arm.com>, "'Manning,
 Sid'" <sidneym@quicinc.com>, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, 'Dillon Min' <dillon.minfei@gmail.com>,
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
Reply-To: bcain@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



> -----Original Message-----
> From: Christoph Hellwig <hch@lst.de>
...
> Switch hexagon to use the generic code for dma_alloc_coherent from
> a global pre-filled pool.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Brian Cain <bcain@codeaurora.org>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
