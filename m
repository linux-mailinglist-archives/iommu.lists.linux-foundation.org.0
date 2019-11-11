Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DC17AF778F
	for <lists.iommu@lfdr.de>; Mon, 11 Nov 2019 16:22:12 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D2274D2E;
	Mon, 11 Nov 2019 15:22:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6DEFFC51
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 15:22:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 02D528B2
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 15:22:06 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 36D8F1E6; Mon, 11 Nov 2019 16:22:05 +0100 (CET)
Date: Mon, 11 Nov 2019 16:22:03 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Adrian Huang <adrianhuang0701@gmail.com>
Subject: Re: [PATCH 1/1] iommu/amd: Fix the overwritten exclusion range with
	multiple IVMDs
Message-ID: <20191111152203.GJ18333@8bytes.org>
References: <20191104055852.24395-1-ahuang12@lenovo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104055852.24395-1-ahuang12@lenovo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, Adrian Huang <ahuang12@lenovo.com>
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

Hi Adrian,

On Mon, Nov 04, 2019 at 01:58:52PM +0800, Adrian Huang wrote:
> 	2) When set_device_exclusion_range() parses the IVMD of devce id
> 	   '4200', the exclusion range of the amd_iommu struct becomes:
> 
> 		iommu->exclusion_start = 0x9F58D000;
> 		iommu->exclusion_length = 0x8040000;
> 
> 	3) When parsing the second IVMD (device id '4300') in
> 	   set_device_exclusion_range(), the exclusion range of the
> 	   amd_iommu struct becomes:
> 
> 		iommu->exclusion_start = 0x9754D000;
> 		iommu->exclusion_length = 0x8040000;
> 
> 	   This overwrites the first IVMD configuration, which leads to
> 	   the failure of the first RAID controller.

Okay, I think this is clearly a BIOS bug as the BIOS should not define
two different exclusion ranges in the IVRS table.

So there are a couple of options here:

	1) Bail out and disable the IOMMU as the BIOS screwed up

	2) Treat per-device exclusion ranges just as r/w unity-mapped
	   regions.


I think option 2) is the best fix here.


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
