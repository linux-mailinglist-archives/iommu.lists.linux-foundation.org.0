Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7578F32E74
	for <lists.iommu@lfdr.de>; Mon,  3 Jun 2019 13:17:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 93BEDB7A;
	Mon,  3 Jun 2019 11:17:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A7F557A4
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 11:17:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 839DF5D3
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 11:17:32 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id C725068AA6; Mon,  3 Jun 2019 13:17:05 +0200 (CEST)
Date: Mon, 3 Jun 2019 13:17:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH] of/device: add blacklist for iommu dma_ops
Message-ID: <20190603111705.GA27163@lst.de>
References: <20181201165348.24140-1-robdclark@gmail.com>
	<CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
	<CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
	<CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
	<CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
	<4864dc3e-6e04-43e5-32c8-2cf5a0705fe5@codeaurora.org>
	<CAF6AEGuFyk1DJWUcQTnW=xsEUhYTYJccjzHJFxvipK4M8UdrUA@mail.gmail.com>
	<CAFp+6iGexVjbak8RQhEQNPp5cV8PK2ubTNNCMyaFPqdTGAbJ0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFp+6iGexVjbak8RQhEQNPp5cV8PK2ubTNNCMyaFPqdTGAbJ0A@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, Archit Taneja <architt@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	freedreno <freedreno@lists.freedesktop.org>,
	Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

If you (and a few others actors in the thread) want people to actually
read what you wrote please follow proper mailing list ettiquette.  I've
given up on reading all the recent mails after scrolling through two
pages of full quotes.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
