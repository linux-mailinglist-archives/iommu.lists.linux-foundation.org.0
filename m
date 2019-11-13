Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 48554FAF37
	for <lists.iommu@lfdr.de>; Wed, 13 Nov 2019 12:02:19 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A0E9D117A;
	Wed, 13 Nov 2019 11:02:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 41189CBA
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 11:02:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AFC2F8AE
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 11:02:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1BF6268AFE; Wed, 13 Nov 2019 12:02:08 +0100 (CET)
Date: Wed, 13 Nov 2019 12:02:07 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: Bug 205201 - overflow of DMA mask and bus mask
Message-ID: <20191113110207.GA7280@lst.de>
References: <3504ee70-02de-049e-6402-2d530bf55a84@xenosoft.de>
	<46025f1b-db20-ac23-7dcd-10bc43bbb6ee@xenosoft.de>
	<20191105162856.GA15402@lst.de>
	<2f3c81bd-d498-066a-12c0-0a7715cda18f@xenosoft.de>
	<d2c614ec-c56e-3ec2-12d0-7561cd30c643@xenosoft.de>
	<af32bfcc-5559-578d-e1f4-75e454c965bf@xenosoft.de>
	<0c5a8009-d28b-601f-3d1a-9de0e869911c@xenosoft.de>
	<a794864f-04ae-9b90-50e7-01b416c861fe@xenosoft.de>
	<20191112144109.GA11805@lst.de>
	<9b14ca1b-2d5d-52b5-c7b4-0e637dbb1157@xenosoft.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b14ca1b-2d5d-52b5-c7b4-0e637dbb1157@xenosoft.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net,
	mad skateman <madskateman@gmail.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	iommu@lists.linux-foundation.org,
	Rob Herring <robh+dt@kernel.org>, paulus@samba.org,
	rtd2@xtra.co.nz, "contact@a-eon.com" <contact@a-eon.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Christoph Hellwig <hch@lst.de>, nsaenzjulienne@suse.de
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

Interesting.  Give me some time to come up with a real fix, as drivers
really should not mess with GFP flags for these allocations, and even
if they did swiotlb is supposed to take care of any resulting problems.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
