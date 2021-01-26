Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA15304484
	for <lists.iommu@lfdr.de>; Tue, 26 Jan 2021 18:07:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D177380ED9;
	Tue, 26 Jan 2021 17:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WSVayry0fKsu; Tue, 26 Jan 2021 17:07:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CC34581A66;
	Tue, 26 Jan 2021 17:07:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB363C013A;
	Tue, 26 Jan 2021 17:07:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43EDFC013A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 341432046B
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rll5G8TAoC0M for <iommu@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 17:07:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 96E8320017
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 17:07:04 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 495E567373; Tue, 26 Jan 2021 18:06:59 +0100 (CET)
Date: Tue, 26 Jan 2021 18:06:59 +0100
From: ". Christoph Hellwig" <hch@lst.de>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20210126170659.GA9104@lst.de>
References: <20201125221917.150463-1-ribalda@chromium.org>
 <20201130083410.GD32234@lst.de> <20201201033658.GE3723071@google.com>
 <20201201144916.GA14682@lst.de>
 <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
 <20201208071320.GA1667627@google.com> <20201209111639.GB22806@lst.de>
 <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com>
 <20210111083614.GA27589@lst.de>
 <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, ". Christoph Hellwig" <hch@lst.de>
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

Please take a quick look at this branch:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_noncontiguous

Warning: hot off the press, and only with the v4l conversion as that
seemed at little easier than uvcvideo.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
