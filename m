Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E7286D7E0C
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 19:46:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 718F6F79;
	Tue, 15 Oct 2019 17:46:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6E4E5F69
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 17:46:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 18EAD88E
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 17:46:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72400337;
	Tue, 15 Oct 2019 10:46:20 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
	C13993F6C4; Tue, 15 Oct 2019 10:46:18 -0700 (PDT)
Date: Tue, 15 Oct 2019 18:46:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH RFC 0/5] ARM: Raspberry Pi 4 DMA support
Message-ID: <20191015174616.GO13874@arrakis.emea.arm.com>
References: <20191014183108.24804-1-nsaenzjulienne@suse.de>
	<20191014205859.GA7634@iMac-3.local>
	<384b42df01c0af973002fba0d5f02068e7f2e7b3.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <384b42df01c0af973002fba0d5f02068e7f2e7b3.camel@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, f.fainelli@gmail.com,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	mbrugger@suse.com, bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, wahrenst@gmx.net
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

On Tue, Oct 15, 2019 at 09:48:22AM +0200, Nicolas Saenz Julienne wrote:
> A little off topic but I was wondering if you have a preferred way to refer to
> the arm architecture in a way that it unambiguously excludes arm64 (for example
> arm32 would work).

arm32 should be fine. Neither arm64 nor arm32 are officially endorsed
ARM Ltd names (officially the exception model is AArch32 while the
instruction set is one of A32/T32/T16).

-- 
Catalin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
