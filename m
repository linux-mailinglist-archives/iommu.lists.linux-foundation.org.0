Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8CA6985A
	for <lists.iommu@lfdr.de>; Mon, 15 Jul 2019 17:26:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 470D4ED6;
	Mon, 15 Jul 2019 15:26:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 92A74B0B
	for <iommu@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 15:20:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1096B879
	for <iommu@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 15:20:49 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x6FF7jnC004608; Mon, 15 Jul 2019 11:20:30 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2truujgjy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 15 Jul 2019 11:20:30 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6FFDhmj021083;
	Mon, 15 Jul 2019 11:20:29 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
	[169.63.214.131])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2truujgjwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 15 Jul 2019 11:20:29 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	x6FF9ogF022024; Mon, 15 Jul 2019 15:20:27 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
	(b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma01dal.us.ibm.com with ESMTP id 2tq6x6g9ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 15 Jul 2019 15:20:27 +0000
Received: from b03ledav006.gho.boulder.ibm.com
	(b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x6FFKQv165470810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 15 Jul 2019 15:20:26 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0EEBC6055;
	Mon, 15 Jul 2019 15:20:25 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 647F0C605B;
	Mon, 15 Jul 2019 15:20:25 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon, 15 Jul 2019 15:20:25 +0000 (GMT)
MIME-Version: 1.0
Date: Mon, 15 Jul 2019 10:23:08 -0500
From: janani <janani@linux.ibm.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH 1/3] x86, s390: Move ARCH_HAS_MEM_ENCRYPT definition to
	arch/Kconfig
Organization: IBM
Mail-Reply-To: janani@linux.ibm.com
In-Reply-To: <20190713044554.28719-2-bauerman@linux.ibm.com>
References: <20190713044554.28719-1-bauerman@linux.ibm.com>
	<20190713044554.28719-2-bauerman@linux.ibm.com>
Message-ID: <3dc137a99c73b1b6582fc854844a417e@linux.vnet.ibm.com>
X-Sender: janani@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-07-15_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1907150181
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Mon, 15 Jul 2019 15:26:06 +0000
Cc: linux-s390@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, Linuxppc-dev
	<linuxppc-dev-bounces+janani=linux.ibm.com@lists.ozlabs.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linuxppc-dev@lists.ozlabs.org, Mike Anderson <andmike@linux.ibm.com>,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Halil Pasic <pasic@linux.ibm.com>,
	iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	linux-fsdevel@vger.kernel.org, Thomas Lendacky <Thomas.Lendacky@amd.com>,
	Robin Murphy <robin.murphy@arm.com>, Alexey Dobriyan <adobriyan@gmail.com>
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
Reply-To: janani@linux.ibm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 2019-07-12 23:45, Thiago Jung Bauermann wrote:
> powerpc is also going to use this feature, so put it in a generic 
> location.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  arch/Kconfig      | 3 +++
>  arch/s390/Kconfig | 3 ---
>  arch/x86/Kconfig  | 4 +---
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index c47b328eada0..4ef3499d4480 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -927,6 +927,9 @@ config LOCK_EVENT_COUNTS
>  	  the chance of application behavior change because of timing
>  	  differences. The counts are reported via debugfs.
> 
> +config ARCH_HAS_MEM_ENCRYPT
> +	bool
> +
>  source "kernel/gcov/Kconfig"
> 
>  source "scripts/gcc-plugins/Kconfig"
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 5d8570ed6cab..f820e631bf89 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -1,7 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -config ARCH_HAS_MEM_ENCRYPT
> -        def_bool y
> -

  Since you are removing the "def_bool y" when ARCH_HAS_MEM_ENCRYPT is 
moved to arch/Kconfig, does the s390/Kconfig need "select 
ARCH_HAS_MEM_ENCRYPT" added like you do for x86/Kconfig?

  - Janani

>  config MMU
>  	def_bool y
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index c9f331bb538b..5d3295f2df94 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -68,6 +68,7 @@ config X86
>  	select ARCH_HAS_FORTIFY_SOURCE
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_KCOV			if X86_64
> +	select ARCH_HAS_MEM_ENCRYPT
>  	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	select ARCH_HAS_PMEM_API		if X86_64
>  	select ARCH_HAS_PTE_SPECIAL
> @@ -1520,9 +1521,6 @@ config X86_CPA_STATISTICS
>  	  helps to determine the effectiveness of preserving large and huge
>  	  page mappings when mapping protections are changed.
> 
> -config ARCH_HAS_MEM_ENCRYPT
> -	def_bool y
> -
>  config AMD_MEM_ENCRYPT
>  	bool "AMD Secure Memory Encryption (SME) support"
>  	depends on X86_64 && CPU_SUP_AMD
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
