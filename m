Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CB32B700
	for <lists.iommu@lfdr.de>; Mon, 27 May 2019 15:51:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 751E2191A;
	Mon, 27 May 2019 13:51:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E4701190D
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 13:50:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 03E6413A
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 13:50:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 046B22F9; Mon, 27 May 2019 15:50:42 +0200 (CEST)
Date: Mon, 27 May 2019 15:50:41 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Kevin Mitchell <kevmitch@arista.com>
Subject: Re: [PATCH 1/3] iommu/amd: make iommu_disable safer
Message-ID: <20190527135041.GD8420@8bytes.org>
References: <20190517005242.20257-1-kevmitch@arista.com>
	<20190517005242.20257-2-kevmitch@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517005242.20257-2-kevmitch@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Kevin,

On Thu, May 16, 2019 at 05:52:40PM -0700, Kevin Mitchell wrote:
> Signed-off-by: Kevin Mitchell <kevmitch@arista.com>

somehow I didn't receive the cover letter and patch 3 of this set, can
you please re-send so I have it all for review?

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
