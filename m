Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DAE5BB01
	for <lists.iommu@lfdr.de>; Mon,  1 Jul 2019 13:55:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F24C7292;
	Mon,  1 Jul 2019 11:54:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 703797268
	for <iommu@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 11:54:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 15E6F832
	for <iommu@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 11:54:58 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 6E2E3229; Mon,  1 Jul 2019 13:54:56 +0200 (CEST)
Date: Mon, 1 Jul 2019 13:54:55 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Kevin Mitchell <kevmitch@arista.com>
Subject: Re: [PATCH 0/3] handle init errors more gracefully in amd_iommu
Message-ID: <20190701115454.GB8166@8bytes.org>
References: <20190612215203.12711-1-kevmitch@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612215203.12711-1-kevmitch@arista.com>
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

On Wed, Jun 12, 2019 at 02:52:01PM -0700, Kevin Mitchell wrote:
> I have tested this series on a variety of AMD CPUs with firmware
> exhibiting the issue. I have additionally tested on platforms where the
> firmware has been fixed. I tried both with and without amd_iommu=off. I
> have also tested on older CPUs where no IOMMU is detected and even one
> where the GART driver ends up running.

Thanks for the fixes, applied them all.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
