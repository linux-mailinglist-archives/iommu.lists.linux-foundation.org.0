Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE6F36C52D
	for <lists.iommu@lfdr.de>; Tue, 27 Apr 2021 13:34:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 457A540217;
	Tue, 27 Apr 2021 11:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXDguvYeHs6N; Tue, 27 Apr 2021 11:34:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F23940234;
	Tue, 27 Apr 2021 11:34:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C31DC000B;
	Tue, 27 Apr 2021 11:34:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98BF8C000B
 for <iommu@lists.linux-foundation.org>; Tue, 27 Apr 2021 11:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8750A4022B
 for <iommu@lists.linux-foundation.org>; Tue, 27 Apr 2021 11:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXi2xxQxFjt8 for <iommu@lists.linux-foundation.org>;
 Tue, 27 Apr 2021 11:34:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A245840217
 for <iommu@lists.linux-foundation.org>; Tue, 27 Apr 2021 11:34:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so6898380wmy.5
 for <iommu@lists.linux-foundation.org>; Tue, 27 Apr 2021 04:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=z9C6sQ611y/zGRe/UW7/e4zr9l8XoO00RXrJcagkHXI=;
 b=ADceqTv77JagwuFR5s9XYfyWOZzLEa1itzG63x+/awj4LHL6EimuX3bNg/jqkU679E
 mKYqV/UOts733gmwYFpMRjNgmhi2N/F64p3P3rqX/Uh5do7cQ7vlossntalvaozE7NGz
 kf/KxYbXgYme8cHq/udvl2WQPFNraJMgMh5PWGdoZ2XI/Lb1WUhJVPFqjXfS8Ex1etJR
 vnz6sdSPEJYuc+LL2v0LHFIgtyGkM3GysbI39aqeENl2J24DoRvo1T/0CK25s4cqrKdC
 f7wIbcrSWQ8GvgsAEhmJ9tc7sjf5CdBnZgX8IDpB5GZNfz+WJ536dSma3F9vkDZXxIA6
 LA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=z9C6sQ611y/zGRe/UW7/e4zr9l8XoO00RXrJcagkHXI=;
 b=AxCcVnKVsdQBEtS3O/6GROAK8MZDpKC3a8LSU3RPW8jN11zXDJLMYEifj026k+0fM3
 Qs74hX+2goO6aYhCbWBKzdsMCLFtxSTGLVOP1RvxOSgk6TDq84fGjItN1OLw7EdAUHfe
 Y0Nd0Ezoabo6Y3XSghRQ6MmGj2z+rDCKmv5peRC/nlrsbf/Eildd4L5+GtkffOk+ui7F
 3NByQxIYxWFjjXJZK1+FpKc/MMqj4bC/6/lM1bh8NeXt1shi+8ZUPJNuZsv+ND38feI+
 QCRXvg58AK/NrW5Qgq0UNfrVko/kSpVeZ3BOjVQ7RMsuM92s6ZzjvyOeE5KDxeSepVkE
 Pp2w==
X-Gm-Message-State: AOAM533VMp6dMZRFSi/xypgXwn12D4UAFci9lmyKKBKb2BuPBzbFkENQ
 BOYPVegXl8O60lfVhucjRZ0=
X-Google-Smtp-Source: ABdhPJxx8bbd49gBf2BOW+mAj9jkSpFMqNRJrMWmqgLw490R5M0aOVJ384sGI0gsYJgtbMJNzHybmw==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr3883978wma.21.1619523269928;
 Tue, 27 Apr 2021 04:34:29 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id k10sm2989203wmf.0.2021.04.27.04.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 04:34:29 -0700 (PDT)
Date: Tue, 27 Apr 2021 13:34:27 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com
Subject: dma-api debugfs directory is not created since debugfs is not
 initialized
Message-ID: <YIf2w1navFNeYjMS@Red>
MIME-Version: 1.0
Content-Disposition: inline
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hello

I try to debug some DMA problem on next-20210427, and so I have enabled CONFIG_DMA_API_DEBUG=y.
But the dma-api directory does show up in debugfs, but lot of other directory exists in it.

After debugging it seems due to commit 56348560d495 ("debugfs: do not attempt to create a new file before the filesystem is initalized")
Reverting the commit permit to "dma-api" debugfs to be found. (but seems not the right way to fix it).

Regards
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
