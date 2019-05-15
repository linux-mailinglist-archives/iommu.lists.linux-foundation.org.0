Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED471EC56
	for <lists.iommu@lfdr.de>; Wed, 15 May 2019 12:48:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E2B1B2388;
	Wed, 15 May 2019 10:48:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 755542365
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 09:59:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 869F18D
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 09:59:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id AC54CAEBB;
	Wed, 15 May 2019 09:59:15 +0000 (UTC)
Message-ID: <1557913582.2950.15.camel@suse.com>
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on
	AMD boards.
From: Oliver Neukum <oneukum@suse.com>
To: "StarostaCZ@gmail.com" <starostacz@gmail.com>, Joerg Roedel
	<joro@8bytes.org>, Johan Hovold <johan@kernel.org>
Date: Wed, 15 May 2019 11:46:22 +0200
In-Reply-To: <3e7ec2f2-ac47-a031-96ba-fa2b9f21ed2e@gmail.com>
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
	<20190429094847.GI26546@localhost> <20190503153716.GE11605@8bytes.org>
	<8748125e-f360-ff0e-ea15-699bce9e7747@gmail.com>
	<4e7f0267-eba8-81c3-4036-25924ea9df98@gmail.com>
	<1557911856.2950.10.camel@suse.com>
	<3e7ec2f2-ac47-a031-96ba-fa2b9f21ed2e@gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 15 May 2019 10:48:45 +0000
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
Content-Type: multipart/mixed; boundary="===============5435310735716584467=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============5435310735716584467==
Content-Type: multipart/alternative; boundary="=-+bxOBBkH1s/kUXUvw/wS"


--=-+bxOBBkH1s/kUXUvw/wS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mi, 2019-05-15 at 11:43 +0200,  StarostaCZ@gmail.com  wrote:
>     As I wrote, I made new test on kernel Linux version
>     5.1.0-050100-generic amd64:
> 
>     https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.1/
> 
>     Same problem, system crash after a few seconds. Full kern.log: https://paste.ee/p/EmLsw

Most helpful. First, try to replicate this with the iommu disabled.
Secondly, make a proper bugreport mentioning the affected kernel version (5.1)
Thirdly, if possible replicate this with the vanilla kernel from kernel.org

>     
> 
>     Unfortunately, I can't judge if the patch is there, but
>         I found, that this patch was added to kernel 5.0.2:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/iommu/amd_iommu.c?id=4e50ce03976fbc8ae995a000c4b10c737467beaa
> 
>       Can I somehow
>             verify that the patch is in this ubuntu kernel 5.1.0?

You would need to look into the kernel source, but this is not necessary.
Joerg's guess was incorrect.

	Regards
		Oliver


    
--=-+bxOBBkH1s/kUXUvw/wS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body><div>On Mi, 2019-05-15 at 11:43 +0200,  StarostaCZ@gmail.com  wrote:</div><blockquote type="cite" style="margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">
    As I wrote, I made new test on kernel Linux version
    5.1.0-050100-generic amd64:<br>
    <a class="moz-txt-link-freetext" href="https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.1/">https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.1/</a><br>
    Same problem, system crash after a few seconds. Full kern.log: <a class="moz-txt-link-freetext" href="https://paste.ee/p/EmLsw">https://paste.ee/p/EmLsw</a><br></blockquote><div><br></div><div><br></div><div>Most helpful. First, try to replicate this with the iommu disabled.</div><div>Secondly, make a proper bugreport mentioning the affected kernel version (5.1)</div><div>Thirdly, if possible replicate this with the vanilla kernel from kernel.org</div><div><br></div><blockquote type="cite" style="margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">
    <br>
    <span class="tlid-translation translation" lang="en"><span title="" class="">Unfortunately, I can't judge if the patch is there, but
        I found, that this patch was added to kernel 5.0.2:<br>
<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/iommu/amd_iommu.c?id=4e50ce03976fbc8ae995a000c4b10c737467beaa">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/iommu/amd_iommu.c?id=4e50ce03976fbc8ae995a000c4b10c737467beaa</a><br>
      </span></span>C<span class="tlid-translation translation" lang="en"><span title="" class=""><span class="tlid-translation
          translation" lang="en"><span title="" class="">an I somehow
            verify that the patch is in this ubuntu kernel 5.1.0?</span></span></span></span></blockquote><div><br></div><div>You would need to look into the kernel source, but this is not necessary.</div><div>Joerg's guess was incorrect.</div><div><br></div><div>	Regards</div><div>		Oliver</div><div><br></div><div>
    </div></body></html>
--=-+bxOBBkH1s/kUXUvw/wS--


--===============5435310735716584467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5435310735716584467==--

