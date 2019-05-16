Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BF420102
	for <lists.iommu@lfdr.de>; Thu, 16 May 2019 10:11:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 139CABBC;
	Thu, 16 May 2019 08:11:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 650C9B62
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 08:11:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EEE1B837
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 08:11:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id E4B80ABB1;
	Thu, 16 May 2019 08:11:44 +0000 (UTC)
Message-ID: <1557993530.14649.0.camel@suse.com>
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on
	AMD boards.
From: Oliver Neukum <oneukum@suse.com>
To: "StarostaCZ@gmail.com" <starostacz@gmail.com>, Joerg Roedel
	<joro@8bytes.org>, Johan Hovold <johan@kernel.org>
Date: Thu, 16 May 2019 09:58:50 +0200
In-Reply-To: <4a48a017-fbcb-619f-f2d5-4d627a673021@gmail.com>
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
	<20190429094847.GI26546@localhost> <20190503153716.GE11605@8bytes.org>
	<8748125e-f360-ff0e-ea15-699bce9e7747@gmail.com>
	<4e7f0267-eba8-81c3-4036-25924ea9df98@gmail.com>
	<1557911856.2950.10.camel@suse.com>
	<3e7ec2f2-ac47-a031-96ba-fa2b9f21ed2e@gmail.com>
	<1557913582.2950.15.camel@suse.com>
	<c57ccafd-7ad4-63e4-54c1-e1fb136ebeed@gmail.com>
	<1557928483.2950.18.camel@suse.com>
	<4a48a017-fbcb-619f-f2d5-4d627a673021@gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>
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

On Mi, 2019-05-15 at 16:15 +0200,  StarostaCZ@gmail.com  wrote:
> Dne 15.5.2019 v 15:54 Oliver Neukum napsal(a):
> > 1. Determine whether the bug depends on the use of an IOMMU
> 
> No, bug not depends on the use of an IOMMU. System crash on both cases.

Interesting.

> > 2.Send a new report to the corresponding mailing list
> 
> Which mailing list is correct?

In that case linux-usb@vger.kernel.org

	HTH
		Oliver

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
